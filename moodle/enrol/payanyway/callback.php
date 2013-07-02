<?php


require("../../config.php");
require_once("$CFG->dirroot/enrol/payanyway/lib.php");


$id = required_param('id', PARAM_INT);

// get plugin instance
if (!$plugin_instance = $DB->get_record("enrol", array("id"=>$id, "status"=>0))) {
    die('FAIL');
}

$plugin = enrol_get_plugin('payanyway');


if(isset($_REQUEST['MNT_ID']) && isset($_REQUEST['MNT_TRANSACTION_ID']) && isset($_REQUEST['MNT_OPERATION_ID'])
   && isset($_REQUEST['MNT_AMOUNT']) && isset($_REQUEST['MNT_CURRENCY_CODE']) && isset($_REQUEST['MNT_TEST_MODE'])
   && isset($_REQUEST['MNT_SIGNATURE']))
{
	$MNT_SIGNATURE = md5("{$_REQUEST['MNT_ID']}{$_REQUEST['MNT_TRANSACTION_ID']}{$_REQUEST['MNT_OPERATION_ID']}{$_REQUEST['MNT_AMOUNT']}{$_REQUEST['MNT_CURRENCY_CODE']}{$_REQUEST['MNT_TEST_MODE']}".$plugin->get_config('mntdataintegritycode'));

	if ($_REQUEST['MNT_SIGNATURE'] == $MNT_SIGNATURE) {
        if (!$payanywaytx = $DB->get_record('enrol_payanyway_transactions', array('id' =>required_param('MNT_TRANSACTION_ID', PARAM_INT)))) {
            die('FAIL');
        }
		
		// enrol the student and continue
		// TODO: ASSUMES the currently logged in user. Does not check the user in $payanywaytx, but they should be the same!
		if (!$plugin_instance = $DB->get_record("enrol", array("id"=>$payanywaytx->instanceid, "status"=>0))) {
			die('FAIL');
		}
		if ($plugin_instance->enrolperiod) {
			$timestart = time();
			$timeend   = $timestart + $plugin_instance->enrolperiod;
		} else {
			$timestart = 0;
			$timeend   = 0;
		}
		// Enrol the user!
		$plugin->enrol_user($plugin_instance, $payanywaytx->userid, $plugin_instance->roleid, $timestart, $timeend);

		// force a refresh of mycourses
		unset($USER->mycourses);
		
		$payanywaytx->success = 1;
        if (!$DB->update_record('enrol_payanyway_transactions', $payanywaytx)) {
            die('FAIL');
        } else {
			die('SUCCESS');
		}
	} else {
		die('FAIL');
	}
} else {
	die('FAIL');
}