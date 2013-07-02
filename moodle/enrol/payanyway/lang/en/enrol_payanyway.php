<?php

$string['pluginname'] = 'PayAnyWay';
$string['pluginname_desc'] = 'This plugin lets you configure courses to be paid for using the PayAnyWay payment gateway.';

$string['status'] = 'Allow PayAnyWay enrolments';
$string['status_desc'] = 'Allow users to use PayAnyWay to enrol into a course by default.';
$string['cost'] = 'Enrol cost';
$string['costerror'] = 'The enrolment cost is not numeric';
$string['costorkey'] = 'Please choose one of the following methods of enrolment.';
$string['currency'] = 'Currency';
$string['defaultrole'] = 'Default role assignment';
$string['defaultrole_desc'] = 'Select role which should be assigned to users during PayAnyWay enrolments';
$string['enrolenddate'] = 'End date';
$string['enrolenddate_help'] = 'If enabled, users can be enrolled until this date only.';
$string['enrolenddaterror'] = 'Enrolment end date cannot be earlier than start date';
$string['enrolperiod'] = 'Enrolment duration';
$string['enrolperiod_desc'] = 'Default length of time that the enrolment is valid (in seconds). If set to zero, the enrolment duration will be unlimited by default.';
$string['enrolperiod_help'] = 'Length of time that the enrolment is valid, starting with the moment the user is enrolled. If disabled, the enrolment duration will be unlimited.';
$string['enrolstartdate'] = 'Start date';
$string['enrolstartdate_help'] = 'If enabled, users can be enrolled from this date onward only.';
$string['paymentserver'] = 'Payment server URL';
$string['mntid'] = 'Account number';
$string['mntdataintegritycode'] = 'Code of data integrity verification';
$string['mnttestmode'] = 'Test mode';
$string['payanywaylogin'] = 'Login in PayAnyWay';
$string['payanywaypassword'] = 'Password in PayAnyWay';
//$string['assignrole'] = 'Assign role';
//$string['nocost'] = 'There is no cost associated with enrolling in this course!';
//$string['payanyway:config'] = 'Configure PayAnyWay enrol instances';
//$string['payanyway:manage'] = 'Manage enrolled users';
//$string['payanyway:unenrol'] = 'Unenrol users from course';
//$string['payanyway:unenrolself'] = 'Unenrol self from the course';
$string['payanywayaccepted'] = 'PayAnyWay payments accepted';
$string['sendpaymentbutton'] = 'Send payment via PayAnyWay';
//$string['unenrolselfconfirm'] = 'Do you really want to unenrol yourself from course "{$a}"?';


/* Errors */
$string['coursenotfound'] = 'Course not found';
$string['error_usercourseempty'] = 'user or course empty';
$string['error_payanywaycurrency'] = 'The course fee is not in a currency recognised by PayAnyWay.';
$string['error_txdatabase'] = 'Fatal: could not create the PayAnyWay transaction in the Moodle database.';


/* Payment systems */
$string['paymentsystem'] = 'Payment system';
$string['payanyway'] = 'PayAnyWay';
$string['banktransfer'] = 'Bank transfer';
$string['ciberpay'] = 'CiberPay';
$string['comepay'] = 'Comepay';
$string['contact'] = 'Contact';
$string['elecsnet'] = 'Elecsnet';
$string['euroset'] = 'Euroset, Svyaznoi';
$string['forward'] = 'Forward Mobile';
$string['gorod'] = 'Federal System GOROD';
$string['mcb'] = 'MoscowCreditBank';
$string['moneta'] = 'Moneta.ru';
$string['moneymail'] = 'Money Mail';
$string['novoplat'] = 'NovoPlat';
$string['plastic'] = 'VISA, Master Card';
$string['platika'] = 'PLATiKA';
$string['post'] = 'Russian Post Transfer';
$string['wallet'] = 'Wallet One';
$string['webmoney'] = 'WebMoney';
$string['yandex'] = 'Yandex.Money';
$string['additionalparameters'] = 'Additional parameters';
$string['eurosetrapidaphone'] = 'Phone number';
$string['moneymailemail'] = 'Email in Money Mail';
$string['mailofrussiasenderindex'] = 'Sender ZIP';
$string['mailofrussiasenderaddress'] = 'Sender address';
$string['mailofrussiasendername'] = 'Sender name';
$string['webmoneyaccountid'] = 'Payment method';


/* Invoice */
$string['invoicetitlecreated'] = 'Invoice was created.';
$string['invoicetitleerror'] = 'Error occured during creating invoice.';
$string['totalamount'] = '<p>Total amount: {$a}</p>';
$string['banktransferinvoicecreated'] = '<p>Transaction is registered for processing. To complete your payment please <a onclick=\'window.open("https://www.payanyway.ru/wiretransferreceipt.htm?transactionId={$a}","newwindow","1,0,0,0,0,resizable=1,scrollbars=1,width=730,height=670");return false;\' href=\'#\'>print receipt</a> and make payment in bank office.</p>';
$string['postinvoicecreated'] = '<p>Transaction is registered for processing. To complete your payment please <a target="_blank" href="https://www.payanyway.ru/mailofrussiablank.htm?operationId={$a}">print post ticket</a> and proceed with payment in any <a target="_blank" href="http://www.russianpost.ru">Russian Post</a> post office.To view post ticket in PDF format you should have a program <a target="_blank" href="http://get.adobe.com/reader/">Adobe Acrobat Reader</a> installed.</p>';
$string['ciberpayinvoicecreated'] = '<p>Contract number for CiberPay is: {$a}</p><p>Transaction is registered. Please proceed payment with CiberPay system using following <b>MONETA.RU</b> account number:</p><p>{$a}</p>';
$string['comepayinvoicecreated'] = '<p>Contract number for ComePay is: {$a}</p><p>Transaction is registered. Please proceed payment with ComePay cash payment terminals using following <b>PayAnyWay</b> account number:</p><p>{$a}</p>';
$string['contactinvoicecreated'] = '<p>Contract number for Contact is: {$a}</p><p>Transaction is registered. Please proceed payment with Contact payment system using following <b>MONETA.RU</b> account number:</p><p>{$a}</p>';
$string['elecsnetinvoicecreated'] = '<p>Contract number for Elecsnet is: {$a}</p><p>Transaction is registered. Please proceed payment with Elecsnet cash payment terminals using following <b>PayAnyWay</b> account number:</p><p>{$a}</p>';
$string['eurosetinvoicecreated'] = '<p>Contract number for Euroset is: {$a}</p><p>Transaction is registered. Please proceed payment with Euroset using following <b>PayAnyWay</b> account number:</p><p>{$a}</p>';
$string['forwardinvoicecreated'] = '<p>Contract number for Forward Mobile is: {$a}</p><p>Transaction is registered. Please proceed payment with Forward Mobile system using following <b>MONETA.RU</b> account number:</p><p>{$a}</p>';
$string['gorodinvoicecreated'] = '<p>Contract number for Federal system GOROD is: {$a}</p><p>Transaction is registered. Please proceed payment with Federal system GOROD using following <b>PayAnyWay</b> account number:</p><p>{$a}</p>';
$string['mcbinvoicecreated'] = '<p>Contract number for MosCreditBank is: {$a}</p><p>Transaction is registered. Please proceed payment with MosCreditBank cash payment terminals using following <b>MONETA.RU</b> account number:</p><p>{$a}</p>';
$string['novoplatinvoicecreated'] = '<p>Contract number for NovoPlat is: {$a}</p><p>Transaction is registered. Please proceed payment with NovoPlat system using following <b>PayAnyWay</b> account number:</p><p>{$a}</p>';
$string['platikainvoicecreated'] = '<p>Contract number for PLATiKA is: {$a}</p><p>Transaction is registered. Please proceed payment with PLATiKA system using following <b>MONETA.RU</b> account number:</p><p>{$a}</p>';
