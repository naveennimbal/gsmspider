<?php
// Merchant key here as provided by Payu
$MERCHANT_KEY = "C0Dr8m";

// Merchant Salt as provided by Payu
$SALT = "3sf0jURk";

// End point - change to https://secure.payu.in for LIVE mode
$PAYU_BASE_URL = "https://test.payu.in";

$action = $PAYU_BASE_URL."/_payment";

$posted = array();
if (!empty($_POST)) {
    //print_r($_POST);
    foreach ($_POST as $key => $value) {

        $posted[$key] = htmlentities($value, ENT_QUOTES);
    }
}
/*foreach ($posted as $key => $value) {
	echo "posted[".$key."]=".$value."<br>";
}*/
//echo $posted;
$formError = 0;
$hash_str ="";
$txnid = uniqid();
$amount = 2.00;
$productinfo = "Resume Info";
$firstname ="Naveen";
$email = "naveen@clickjobs.com";
$surl = "http://gsmspider.loc/payment2.php";
$furl = "http://gsmspider.loc/payment2.php";
$phone ="9999999999";

  $hash_str .=  $MERCHANT_KEY."|";
  $hash_str .=  $txnid."|";
  $hash_str .=  $amount."|";
  $hash_str .=  $productinfo."|";
  $hash_str .=  $firstname."|";
  $hash_str .=  $email."|";
  $hash_str .=  "||||||||||".$SALT;
  $hash = strtolower(hash('sha512', $hash_str));
  
  echo "<pre>";
print_r($_POST);
?>

<html>
<script>
    var hash = '<?php echo $hash ?>';
    function submitPayuForm() {
        if (hash == '') {
            return;
        }
        var payuForm = document.forms.payuForm;
       // payuForm.submit();
    }
</script>
<body onLoad="submitPayuForm();">
<h2>PayU Form</h2>
<br/>
<?php if ($formError) { ?>
    <span style="color:red">Please fill all mandatory fields.</span>
    <br/>
    <br/>
<?php } ?>
<form action="<?php echo $action; ?>" method="post" name="payuForm">
    <input type="hidden" name="key" value="<?php echo $MERCHANT_KEY ?>"/>
    <input type="hidden" name="hash" value="<?php echo $hash ?>"/>
    <input type="hidden" name="address" value="address"/>
    
    <table>
        <tr>
            <td><b>Mandatory Parameters</b></td>
        </tr>
        <tr>
            <td>TXNID:</td>
            <td><input name="txnid" value="<?php echo $txnid ?>"/></td>
            
        </tr>
        <tr>
            <td>Amount:</td>
            <td><input name="amount" value="<?php echo $amount ?>"/></td>
            <td>First Name:</td>
            <td><input name="firstname" id="firstname"
                       value="<?php echo $firstname?>"/></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input name="email" id="email"
                       value="<?php echo $email ?>"/></td>
            <td>Phone:</td>
            <td><input name="phone" value="<?php echo $phone ?>"/></td>
        </tr>
        <tr>
            <td>Product Info:</td>
            <td colspan="3"><input name="productinfo"
                                   value="<?php echo $productinfo ?>"
                                   size="64"/></td>
        </tr>
        <tr>
            <td>Success URI:</td>
            <td colspan="3"><input name="surl" value="<?php echo $surl ?>"
                                   size="64"/></td>
        </tr>
        <tr>
            <td>Failure URI:</td>
            <td colspan="3"><input name="furl" value="<?php echo $furl?>"
                                   size="64"/></td>
        </tr>
        <tr>
            <td><b>Optional Parameters</b></td>
        </tr>
        <!--- <tr>
		  <td>Last Name: </td>
		  <td><input name="lastname" id="lastname" value="<?php echo (empty($posted['lastname'])) ? '' : $posted['lastname']; ?>" /></td>
		  <td>Cancel URI: </td>
		  <td><input name="curl" value="" /></td>
		</tr>
		<tr>
		  <td>Address1: </td>
		  <td><input name="address1" value="<?php echo (empty($posted['address1'])) ? '' : $posted['address1']; ?>" /></td>
		  <td>Address2: </td>
		  <td><input name="address2" value="<?php echo (empty($posted['address2'])) ? '' : $posted['address2']; ?>" /></td>
		</tr>
		<tr>
		  <td>City: </td>
		  <td><input name="city" value="<?php echo (empty($posted['city'])) ? '' : $posted['city']; ?>" /></td>
		  <td>State: </td>
		  <td><input name="state" value="<?php echo (empty($posted['state'])) ? '' : $posted['state']; ?>" /></td>
		</tr>
		<tr>
		  <td>Country: </td>
		  <td><input name="country" value="<?php echo (empty($posted['country'])) ? '' : $posted['country']; ?>" /></td>
		  <td>Zipcode: </td>
		  <td><input name="zipcode" value="<?php echo (empty($posted['zipcode'])) ? '' : $posted['zipcode']; ?>" /></td>
		</tr>
		<tr>
		  <td>UDF1: </td>
		  <td><input name="udf1" value="<?php echo (empty($posted['udf1'])) ? '' : $posted['udf1']; ?>" /></td>
		  <td>UDF2: </td>
		  <td><input name="udf2" value="<?php echo (empty($posted['udf2'])) ? '' : $posted['udf2']; ?>" /></td>
		</tr>
		<tr>
		  <td>UDF3: </td>
		  <td><input name="udf3" value="<?php echo (empty($posted['udf3'])) ? '' : $posted['udf3']; ?>" /></td>
		  <td>UDF4: </td>
		  <td><input name="udf4" value="<?php echo (empty($posted['udf4'])) ? '' : $posted['udf4']; ?>" /></td>
		</tr>
		<tr>
		  <td>UDF5: </td>
		  <td><input name="udf5" value="<?php echo (empty($posted['udf5'])) ? '' : $posted['udf5']; ?>" /></td>
		  <td>PG: </td>
		  <td><input name="pg" value="<?php echo (empty($posted['pg'])) ? '' : $posted['pg']; ?>" /></td>
		</tr>
	<tr>
		  <td>COD URL: </td>
		  <td><input name="codurl" value="<?php echo (empty($posted['codurl'])) ? '' : $posted['codurl']; ?>" /></td>
		  <td>TOUT URL: </td>
		  <td><input name="touturl" value="<?php echo (empty($posted['touturl'])) ? '' : $posted['touturl']; ?>" /></td>
		</tr>
	<tr>
		  <td>Drop Category: </td>
		  <td><input name="drop_category" value="<?php echo (empty($posted['drop_category'])) ? '' : $posted['drop_category']; ?>" /></td>
		  <td>Custom Note: </td>
		  <td><input name="custom_note" value="<?php echo (empty($posted['custom_note'])) ? '' : $posted['custom_note']; ?>" /></td>
		</tr>
	<tr>
		  <td>Note Category: </td>
		  <td><input name="note_category" value="<?php echo (empty($posted['note_category'])) ? '' : $posted['note_category']; ?>" /></td>
		</tr>--->
        <tr>
            <?php if (!$hash) { ?>
                <td colspan="4"><input type="submit" value="Submit"/></td>
            <?php } ?>
        </tr>
    </table>
</form>

</body>
</html>
