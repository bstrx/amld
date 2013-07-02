<?php

// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Paypal utility script
 *
 * @package    enrol
 * @subpackage payanyway
 * @subpackage file
 * @copyright  2004 onwards Martin Dougiamas (http://dougiamas.com)
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

require("../../config.php");
require_once("$CFG->dirroot/enrol/payanyway/lib.php");

$id = required_param('id', PARAM_INT);

// get plugin instance
if (!$plugin_instance = $DB->get_record("enrol", array("id"=>$id, "status"=>0))) {
    print_error('invalidinstance');
}

$plugin = enrol_get_plugin('payanyway');

if (!$course = $DB->get_record("course", array("id"=>$plugin_instance->courseid))) {
    redirect($CFG->wwwroot);
}

$context = get_context_instance(CONTEXT_COURSE, $course->id, MUST_EXIST);

require_login();


require_once (dirname(__FILE__) . '/MonetaAPI/MonetaWebService.php');

switch ($plugin->get_config('paymentserver'))
{
	case "demo.moneta.ru":
		$service = new MonetaWebService("https://demo.moneta.ru/services.wsdl", $plugin->get_config('payanywaylogin'), $plugin->get_config('payanywaypassword'));
		break;
	case "www.payanyway.ru":
		$service = new MonetaWebService("https://www.moneta.ru/services.wsdl", $plugin->get_config('payanywaylogin'), $plugin->get_config('payanywaypassword'));
		break;
}
//    echo $OUTPUT->header();
//	echo $OUTPUT->heading(get_string('invoicetitlecreated', 'enrol_payanyway'));
//	
//	echo $OUTPUT->box_start('generalbox', 'notice');
//	echo $OUTPUT->container(get_string('banktransferinvoicecreated', 'enrol_payanyway', 12345));
//	echo $OUTPUT->box_end();
//	
//	echo $OUTPUT->footer();
//exit;
$paymentsystem = $_REQUEST['paymentsystem'];
try
{
	// получить данные счета
	$request = new MonetaInvoiceRequest();
	$request->payer = $_REQUEST['paymentSystem_accountId'];
	$request->payee = $_REQUEST['MNT_ID'];
	$request->amount = $_REQUEST['MNT_AMOUNT'];
	$request->clientTransaction = $_REQUEST['MNT_TRANSACTION_ID'];
	if ($paymentsystem == 'post')
	{
		$operationInfo = new MonetaOperationInfo();
		$a1 = new MonetaKeyValueAttribute();
		$a1->key = 'mailofrussiaindex';
		$a1->value = $_REQUEST['additionalParameters_mailofrussiaSenderIndex'];
		$operationInfo->addAttribute($a1);
		$a2 = new MonetaKeyValueAttribute();
		$a2->key = 'mailofrussiaaddress';
		$a2->value = $_REQUEST['additionalParameters_mailofrussiaSenderAddress'];
		$operationInfo->addAttribute($a2);
		$a3 = new MonetaKeyValueAttribute();
		$a3->key = 'mailofrussianame';
		$a3->value = $_REQUEST['additionalParameters_mailofrussiaSenderName'];
		$operationInfo->addAttribute($a3);
		$request->operationInfo = $operationInfo;
	}
	elseif ($paymentsystem == 'euroset')
	{
		$operationInfo = new MonetaOperationInfo();
		$a1 = new MonetaKeyValueAttribute();
		$a1->key = 'rapidamphone';
		$a1->value = $_REQUEST['additionalParameters_rapidaPhone'];
		$operationInfo->addAttribute($a1);
		$request->operationInfo = $operationInfo;
	}
	
	$response = $service->Invoice($request);
	if ($paymentsystem == 'euroset')
	{
		$response1 = $service->GetOperationDetailsById($response->transaction);
		foreach ($response1->operation->attribute as $attr)
		{
			if ($attr->key == 'rapidatid')
			{
				$transaction_id = str_pad($attr->value, 10, "0", STR_PAD_LEFT);
			}
		}
	}
	else
	{
		$transaction_id = str_pad($response->transaction, 10, "0", STR_PAD_LEFT);
	}

    echo $OUTPUT->header();
	echo $OUTPUT->heading(get_string('invoicetitlecreated', 'enrol_payanyway'));
	
	echo $OUTPUT->box_start('generalbox', 'notice');
	echo $OUTPUT->container(get_string($paymentsystem.'invoicecreated', 'enrol_payanyway', $transaction_id));
	if (!in_array($paymentsystem, array('banktransfer', 'post')))
	{
		echo $OUTPUT->container(get_string('totalamount', 'enrol_payanyway', $_REQUEST['MNT_AMOUNT']." ".$_REQUEST['MNT_CURRENCY_CODE']));
	}
	echo $OUTPUT->box_end();
	
	echo $OUTPUT->footer();
}
catch (Exception $e)
{
    echo $OUTPUT->header();
	echo $OUTPUT->heading(get_string('invoicetitleerror', 'enrol_payanyway'));
	
	echo $OUTPUT->box_start('generalbox', 'notice');
	echo $OUTPUT->container($e->getMessage());
	echo $OUTPUT->box_end();
	
	echo $OUTPUT->footer();
	
}


