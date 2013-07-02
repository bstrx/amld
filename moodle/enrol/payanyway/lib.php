<?php

defined('MOODLE_INTERNAL') or die();


/**
* PayAnyWay enrolment plugin for NZ PayAnyWay Payment Express.
* Developed by Catalyst IT Limited for The Open Polytechnic of New Zealand.
* Uses the PayAnyWay PxPay method (redirect and return).
*/
class enrol_payanyway_plugin extends enrol_plugin {

    /**
     * Constructor.
     * Fetches configuration from the database and sets up language strings.
     */
    function __construct() {

        // set up the configuration
        $this->load_config();
        $this->recognised_currencies = array(
			'RUB',
            'CAD',
            'EUR',
            'GBP',
            'USD',
        );
        $this->payanyway_url = 'https://www.payanyway.ru/';
    }

    /**
     * Returns optional enrolment information icons.
     *
     * This is used in course list for quick overview of enrolment options.
     *
     * We are not using single instance parameter because sometimes
     * we might want to prevent icon repetition when multiple instances
     * of one type exist. One instance may also produce several icons.
     *
     * @param array $instances all enrol instances of this type in one course
     * @return array of pix_icon
     */
    public function get_info_icons(array $instances) {
        return array(new pix_icon('icon', get_string('pluginname', 'enrol_payanyway'), 'enrol_payanyway'));
    }

    public function roles_protected() {
        // users with role assign cap may tweak the roles later
        return false;
    }

    public function allow_unenrol(stdClass $instance) {
        // users with unenrol cap may unenrol other users manually - requires enrol/payanyway:unenrol
        return true;
    }

    public function allow_manage(stdClass $instance) {
        // users with manage cap may tweak period and status - requires enrol/payanyway:manage
        return true;
    }

    public function show_enrolme_link(stdClass $instance) {
        return ($instance->status == ENROL_INSTANCE_ENABLED);
    }

    /**
     * Sets up navigation entries.
     *
     * @param object $instance
     * @return void
     */
    public function add_course_navigation($instancesnode, stdClass $instance) {
        if ($instance->enrol !== 'payanyway') {
             throw new coding_exception('Invalid enrol instance type!');
        }

        $context = get_context_instance(CONTEXT_COURSE, $instance->courseid);
        if (has_capability('enrol/payanyway:config', $context)) {
            $managelink = new moodle_url('/enrol/payanyway/edit.php', array('courseid'=>$instance->courseid, 'id'=>$instance->id));
            $instancesnode->add($this->get_instance_name($instance), $managelink, navigation_node::TYPE_SETTING);
        }
    }

    /**
     * Returns edit icons for the page with list of instances
     * @param stdClass $instance
     * @return array
     */
    public function get_action_icons(stdClass $instance) {
        global $OUTPUT;

        if ($instance->enrol !== 'payanyway') {
            throw new coding_exception('invalid enrol instance!');
        }
        $context = get_context_instance(CONTEXT_COURSE, $instance->courseid);

        $icons = array();

        if (has_capability('enrol/payanyway:config', $context)) {
            $editlink = new moodle_url("/enrol/payanyway/edit.php", array('courseid'=>$instance->courseid, 'id'=>$instance->id));
            $icons[] = $OUTPUT->action_icon($editlink, new pix_icon('i/edit', get_string('edit'), 'core', array('class'=>'icon')));
        }

        return $icons;
    }

    /**
     * Returns link to page which may be used to add new instance of enrolment plugin in course.
     * @param int $courseid
     * @return moodle_url page url
     */
    public function get_newinstance_link($courseid) {
        $context = get_context_instance(CONTEXT_COURSE, $courseid, MUST_EXIST);

        if (!has_capability('moodle/course:enrolconfig', $context) or !has_capability('enrol/payanyway:config', $context)) {
            return NULL;
        }

        // multiple instances supported - different cost for different roles
        return new moodle_url('/enrol/payanyway/edit.php', array('courseid'=>$courseid));
    }

    /**
     * Creates course enrol form, checks if form submitted
     * and enrols user if necessary. It can also redirect.
     *
     * @param stdClass $instance
     * @return string html text, usually a form in a text box
     */
    function enrol_page_hook(stdClass $instance) {
        global $CFG, $USER, $OUTPUT, $PAGE, $DB;

        ob_start();

        if ($DB->record_exists('user_enrolments', array('userid'=>$USER->id, 'enrolid'=>$instance->id))) {
            return ob_get_clean();
        }

        if ($instance->enrolstartdate != 0 && $instance->enrolstartdate > time()) {
            return ob_get_clean();
        }

        if ($instance->enrolenddate != 0 && $instance->enrolenddate < time()) {
            return ob_get_clean();
        }

        $course = $DB->get_record('course', array('id'=>$instance->courseid));
        $context = get_context_instance(CONTEXT_COURSE, $course->id);

        $shortname = format_string($course->shortname, true, array('context' => $context));
        $strloginto = get_string("loginto", "", $shortname);
        $strcourses = get_string("courses");

        // Pass $view=true to filter hidden caps if the user cannot see them
        if ($users = get_users_by_capability($context, 'moodle/course:update', 'u.*', 'u.id ASC',
                                             '', '', '', '', false, true)) {
            $users = sort_by_roleassignment_authority($users, $context);
            $teacher = array_shift($users);
        } else {
            $teacher = false;
        }

        if ( (float) $instance->cost <= 0 ) {
            $cost = (float) $this->get_config('cost');
        } else {
            $cost = (float) $instance->cost;
        }

        if (abs($cost) < 0.01) { // no cost, other enrolment methods (instances) should be used
            echo '<p>'.get_string('nocost', 'enrol_payanyway').'</p>';
        } else {

            if (isguestuser()) { // force login only for guest user, not real users with guest role
                if (empty($CFG->loginhttps)) {
                    $wwwroot = $CFG->wwwroot;
                } else {
                    // This actually is not so secure ;-), 'cause we're
                    // in unencrypted connection...
                    $wwwroot = str_replace("http://", "https://", $CFG->wwwroot);
                }
                echo '<div class="mdl-align"><p>'.get_string('paymentrequired').'</p>';
                echo '<p><b>'.get_string('cost').": $instance->currency $cost".'</b></p>';
                echo '<p><a href="'.$wwwroot.'/login/">'.get_string('loginsite').'</a></p>';
                echo '</div>';
            } else {
                //Sanitise some fields before building the payanyway form
                $coursefullname  = format_string($course->fullname, true, array('context'=>$context));
                $courseshortname = $shortname;
                $userfullname    = fullname($USER);
                $userfirstname   = $USER->firstname;
                $userlastname    = $USER->lastname;
                $useraddress     = $USER->address;
                $usercity        = $USER->city;
                $instancename    = $this->get_instance_name($instance);

                include($CFG->dirroot.'/enrol/payanyway/enrol.html');
            }
        }

        return $OUTPUT->box(ob_get_clean());
    }

    /**
     * Start the PayAnyWay transaction by storing a record in the transactions table
     * and returning the GenerateRequest XML message.
     *
     * @param object $instance The course to be enroled.
     * @param object $user
     * @return string
     * @access public
     */
    function begin_transaction($instance, $user) {
        global $CFG, $DB;
		
        if (!$course = $DB->get_record('course', array('id' => $instance->courseid))) {
            print_error('coursenotfound', 'enrol_payanyway');
        }
        if (empty($course) or empty($user)) {
            print_error('error_usercourseempty', 'enrol_payanyway');
        }

        if (!in_array($instance->currency, $this->recognised_currencies)) {
            print_error('error_payanywaycurrency', 'enrol_payanyway');
        }

        // log the transaction
        $fullname = fullname($user);
        $payanywaytx->courseid = $course->id;
        $payanywaytx->userid = $user->id;
        $payanywaytx->instanceid = $instance->id;
        $payanywaytx->cost = clean_param(format_float((float)$instance->cost, 2), PARAM_CLEAN);
        $payanywaytx->currency = clean_param($instance->currency, PARAM_CLEAN);
        $payanywaytx->date_created = time();
//        $site = get_site();
//        $sitepart   = substr($site->shortname, 0, 20);
//        $coursepart = substr("{$course->id}:{$course->shortname}", 0, 20);
//        $userpart   = substr("{$user->id}:{$user->lastname} {$user->firstname}", 0, 20);
//        $payanywaytx->merchantreference = clean_param(strtoupper("$sitepart:{$coursepart}:{$userpart}"), PARAM_CLEAN);
//        $payanywaytx->email = clean_param($user->email, PARAM_CLEAN);
//        $payanywaytx->txndata1 = clean_param("{$payanywaytx->courseid}: {$course->fullname}", PARAM_CLEAN);
//        $payanywaytx->txndata2 = clean_param("{$payanywaytx->userid}: {$fullname}", PARAM_CLEAN);
//        $payanywaytx->txndata3 = "";

        if (!$payanywaytx->id = $DB->insert_record('enrol_payanyway_transactions', $payanywaytx)) {
            print_error('error_txdatabase', 'enrol_payanyway');
        }

        return $payanywaytx->id;
    }

    /**
     * Start the PayAnyWay transaction by storing a record in the transactions table
     * and returning the GenerateRequest XML message.
     *
     * @param object $course The course to be enroled.
     * @param object $result
     * @return string
     * @access public
     */
    function confirm_transaction($result) {
        global $USER, $SESSION, $CFG, $DB;

        $xmlrequest = "<ProcessResponse>
            <PxPayUserId>{$this->config->userid}</PxPayUserId>
            <PxPayKey>{$this->config->key}</PxPayKey>
            <Response>{$result}</Response>\n</ProcessResponse>";
        $xmlreply = $this->querypayanyway($xmlrequest);
        $response = $this->getdom($xmlreply);

        // abort if invalid
        if ($response === false or $response->attributes()->valid != '1') {
            print_error('error_txinvalid', 'enrol_payanyway');
        }
        if (!$payanywaytx = $DB->get_record('enrol_payanyway_transactions', array('id' =>$response->TxnId))) {
            print_error('error_txnotfound', 'enrol_payanyway');
        }

        // abort if already processed
        if (!empty($payanywaytx->response)) {
            print_error('error_txalreadyprocessed', 'enrol_payanyway');
        }

        $payanywaytx->success    = clean_param($response->Success, PARAM_CLEAN);
        $payanywaytx->authcode   = clean_param($response->AuthCode, PARAM_CLEAN);
        $payanywaytx->cardtype   = clean_param($response->CardName, PARAM_CLEAN);
        $payanywaytx->cardholder = clean_param($response->CardHolderName, PARAM_CLEAN);
        $payanywaytx->cardnumber = clean_param($response->CardNumber, PARAM_CLEAN); // truncated form only
        $payanywaytx->cardexpiry = clean_param($response->DateExpiry, PARAM_CLEAN);
        $payanywaytx->clientinfo = clean_param($response->ClientInfo, PARAM_CLEAN);
        $payanywaytx->payanywaytxnref  = clean_param($response->DpsTxnRef, PARAM_CLEAN);
        $payanywaytx->txnmac     = clean_param($response->TxnMac, PARAM_CLEAN);
        $payanywaytx->response   = clean_param($response->ResponseText, PARAM_CLEAN);

        // update transaction
        if (!$DB->update_record('enrol_payanyway_transactions', $payanywaytx)) {
            print_error('error_txnotfound', 'enrol_payanyway');
        }

        // recover the course
        list($courseid, $coursename) = explode(":", $payanywaytx->txndata1);
        $course = $DB->get_record('course', array('id' => $courseid));

        // enrol and continue if PayAnyWay returns "APPROVED"
        if ($payanywaytx->success == 1 and $payanywaytx->response == "APPROVED") {

            // enrol the student and continue
            // TODO: ASSUMES the currently logged in user. Does not check the user in $payanywaytx, but they should be the same!
            if (!$plugin_instance = $DB->get_record("enrol", array("id"=>$payanywaytx->instanceid, "status"=>0))) {
                print_error('Not a valid instance id');
            }
            if ($plugin_instance->enrolperiod) {
                $timestart = time();
                $timeend   = $timestart + $plugin_instance->enrolperiod;
            } else {
                $timestart = 0;
                $timeend   = 0;
            }
            // Enrol the user!
            $this->enrol_user($plugin_instance, $payanywaytx->userid, $plugin_instance->roleid, $timestart, $timeend);

            // force a refresh of mycourses
            unset($USER->mycourses);

            // redirect to course view
            if ($SESSION->wantsurl) {
                $destination = $SESSION->wantsurl;
                unset($SESSION->wantsurl);
            } else {
                $destination = "{$CFG->wwwroot}/course/view.php?id={$course->id}";
            }
            redirect($destination);
        } else {
            // abort
            print_error('error_paymentunsucessful', 'enrol_payanyway');
        }
    }

    /**
     * Roll back the PayAnyWay transaction by updating the record in the transactions
     * table.
     *
     * @param object $course The course to be enroled.
     * @param object $result
     * @return string
     * @access public
     */
    function abort_transaction($result) {
        global $USER, $SESSION, $CFG, $DB;

        $xmlrequest = "<ProcessResponse>
            <PxPayUserId>{$this->config->userid}</PxPayUserId>
            <PxPayKey>{$this->config->key}</PxPayKey>
            <Response>{$result}</Response>\n</ProcessResponse>";
        $xmlreply = $this->querypayanyway($xmlrequest);
        $response = $this->getdom($xmlreply);

        // abort if invalid
        if ($response === false or $response->attributes()->valid != '1') {
            print_error('error_txinvalid', 'enrol_payanyway');
        }
        if (!$payanywaytx = $DB->get_record('enrol_payanyway_transactions', array('id' => $response->TxnId))) {
            print_error('error_txnotfound', 'enrol_payanyway');
        }

        // abort if already processed
        if (!empty($payanywaytx->response)) {
            print_error('error_txalreadyprocessed', 'enrol_payanyway');
        }

        $payanywaytx->success    = clean_param($response->Success, PARAM_CLEAN);
        $payanywaytx->authcode   = clean_param($response->AuthCode, PARAM_CLEAN);
        $payanywaytx->cardtype   = clean_param($response->CardName, PARAM_CLEAN);
        $payanywaytx->cardholder = clean_param($response->CardHolderName, PARAM_CLEAN);
        $payanywaytx->cardnumber = clean_param($response->CardNumber, PARAM_CLEAN); // truncated form only
        $payanywaytx->cardexpiry = clean_param($response->DateExpiry, PARAM_CLEAN);
        $payanywaytx->clientinfo = clean_param($response->ClientInfo, PARAM_CLEAN);
        $payanywaytx->payanywaytxnref  = clean_param($response->DpsTxnRef, PARAM_CLEAN);
        $payanywaytx->txnmac     = clean_param($response->TxnMac, PARAM_CLEAN);
        $payanywaytx->response   = clean_param($response->ResponseText, PARAM_CLEAN);

        // update transaction
        if (!$DB->update_record('enrol_payanyway_transactions', $payanywaytx)) {
            print_error('error_txnotfound', 'enrol_payanyway');
        }

        print_error('error_paymentfailure', 'enrol_payanyway', '', $payanywaytx->response);
    }

    /**
    * Cron method.
    * @return void
    */
    function cron() {
    }

    /**
     * Turn an XML string into a DOM object.
     *
     * @param string $xml An XML string
     * @return object The SimpleXMLElement object representing the root element.
     * @access public
     */
    function getdom($xml) {
        $dom = new DomDocument();
        $dom->preserveWhiteSpace = false;
        $dom->loadXML($xml);
        return simplexml_import_dom($dom);
    }

//    /**
//     * Send an XML message to the PayAnyWay service and return the XML response.
//     *
//     * @param string $xml The XML request to send.
//     * @return string The XML response from PayAnyWay.
//     * @access public
//     */
//	function querypayanyway($xml){
//        if (!extension_loaded('curl') or ($curl = curl_init($this->payanyway_url)) === false) {
//            print_error('curlrequired', 'enrol_payanyway');
//        }
//
//		curl_setopt($curl, CURLOPT_URL, $this->payanyway_url);
//		curl_setopt($curl, CURLOPT_POST, 1);
//		curl_setopt($curl, CURLOPT_POSTFIELDS, $xml);
//		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
//		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
//
//		// TODO: fix up curl proxy stuffs, c.f. lib/filelib.php
//		//curl_setopt($ch,CURLOPT_PROXY , "{$CFG->proxyhost}:{$CFG->proxyport}");
//		//curl_setopt($ch,CURLOPT_PROXYUSERPWD,"{$CFG->proxyuser}:{$CFG->proxypassword}");
//
//		$response = curl_exec($curl);
//		curl_close($curl);
//		return $response;
//	}
}

