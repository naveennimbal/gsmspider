<?php
/**
 * Created by PhpStorm.
 * User: Naveen
 * Date: 3/10/15
 * Time: 10:08 PM
 */


ini_set("display_error", 1);
/**
 * Created by PhpStorm.
 * User: Naveen
 * Date: 12/14/14
 * Time: 6:33 PM
 */
include_once 'config.php';
include_once 'simple_html_dom.php';
include_once 'simple_html_dom_utility.php';
//include_once 'functions.php';


//get the brand list


$html = file_get_html('http://www.gsmarena.com/');

//echo $html;
//echo "<pre>";

$brantsStr = <<<HTML
<ul>
<li><a href="samsung-phones-9.php">Samsung</a></li>
<li class="on"><a href="apple-phones-48.php">Apple</a></li>
<li><a href="microsoft-phones-64.php">Microsoft</a></li>
<li><a href="nokia-phones-1.php">Nokia</a></li>
<li><a href="sony-phones-7.php">Sony</a></li>
<li><a href="lg-phones-20.php">LG</a></li>
<li><a href="htc-phones-45.php">HTC</a></li>
<li><a href="motorola-phones-4.php">Motorola</a></li>
<li><a href="huawei-phones-58.php">Huawei</a></li>
<li><a href="lenovo-phones-73.php">Lenovo</a></li>
<li><a href="xiaomi-phones-80.php">Xiaomi</a></li>
<li><a href="acer-phones-59.php">Acer</a></li>
<li><a href="asus-phones-46.php">Asus</a></li>
<li><a href="blackberry-phones-36.php">BlackBerry</a></li>
<li><a href="alcatel-phones-5.php">Alcatel</a></li>
<li><a href="zte-phones-62.php">ZTE</a></li>
<li><a href="toshiba-phones-44.php">Toshiba</a></li>
<li><a href="vodafone-phones-53.php">Vodafone</a></li>
<li><a href="t_mobile-phones-55.php">T-Mobile</a></li>
<li><a href="gigabyte-phones-47.php">Gigabyte</a></li>
<li><a href="pantech-phones-32.php">Pantech</a></li>
<li><a href="xolo-phones-85.php">XOLO</a></li>
<li><a href="lava-phones-94.php">Lava</a></li>
<li><a href="micromax-phones-66.php">Micromax</a>
</li><li><a href="blu-phones-67.php">BLU</a></li>
<li><a href="spice-phones-68.php">Spice</a></li>
<li><a href="prestigio-phones-86.php">Prestigio</a>
</li><li><a href="verykool-phones-70.php">verykool</a></li>
<li><a href="maxwest-phones-87.php">Maxwest</a></li>
<li><a href="celkon-phones-75.php">Celkon</a></li>
<li><a href="gionee-phones-92.php">Gionee</a></li>
<li><a href="vivo-phones-98.php">vivo</a></li>
<li><a href="niu-phones-79.php">NIU</a></li>
<li><a href="yezz-phones-78.php">Yezz</a></li>
<li><a href="parla-phones-81.php">Parla</a></li>
<li><a href="plum-phones-72.php">Plum</a></li>
</ul>

HTML;
//$html = str_get_html($brantsStr);
//echo "<pre>";

$category = array();

/*
  foreach($html->find('div#brandmenu') as $ul){
  foreach($ul->find('li') as $li){
  $link =  str_get_html($li->innertext) ;
  $href = $link->find('a');
  // var_dump($href[0]->attr['href']);
  $category[] = "http://www.gsmarena.com/".$href[0]->attr['href'];
  //echo "<br>";
  //exit;
  }

  //print_r($category);
  //echo $li->href;

  exit;
  }
 */
// get all the phones
$category[] = "http://www.gsmarena.com/samsung-phones-9.php";
$category[] = "http://www.gsmarena.com/samsung-phones-f-9-0-p2.php";
$category[] = "http://www.gsmarena.com/samsung-phones-f-9-0-p3.php";
$phoneLinks = array();
/*
foreach ($category as $cat) {
    $html = file_get_html($cat);
    //echo $html;
    foreach ($html->find('div.makers') as $ul) {
        foreach ($ul->find('li') as $li) {
            $link = str_get_html($li->innertext);
            $href = $link->find('a');
            // var_dump($href[0]->attr['href']);
            $phoneLinks[] = "http://www.gsmarena.com/" . $href[0]->attr['href'];
        }
    }
}
*/
//print_r($phoneLinks);
//http://www.gsmarena.com/samsung_galaxy_core_prime-6716.php


function getGSMProduct($url)
{
    // getContent($url);
    //$html = file_get_html('product.html');
    $html = file_get_html($url);

    $data = array();
    $productname = $html->find('h1', 0);
    $data['product_name'] = strip_tags($productname->innertext);

    $spec = $html->find('div#specs-list', 0);
    $specHtml = str_get_html($spec->outertext);
    foreach ($specHtml->find('table') as $table) {

        foreach ($table->find('th') as $th) {
            //echo $th->outertext;
            //echo "\n";
            $tdText = str_get_html($th->innertext);
            //print_r($tdText->innertext);
            //exit;
        }

        foreach ($table->find('td') as $td) {
            //echo $td->innertext;

            if ($td->innertext != "") {
                $link = str_get_html($td->innertext);
                $href = $link->find('a', -1);
                $keyname = "";
                if (isset($href)) {
                    //$data[$href[0]->innertext] ;
                    $keyname = strtolower(($href->innertext));
                    $data[$keyname] = "";
                    $keyname2 = strtolower(strip_tags($href->innertext));
                } else {
                    $keyname = "";
                }
                if ($keyname == "" && !isset($href)) {
                    if ($data[$keyname2] == "") {
                        $data[$keyname2] = strip_tags($td->innertext);
                    } else {
                        $data['battery'] = strip_tags($td->innertext);
                    }

                    if ($keyname == "internal") {
                        $data['ram'] = "";
                        $data['internal'] = "";
                        $mem = explode(",", strip_tags($td->innertext));
                        $data['ram'] = $mem[1];
                        $data['internal'] = $mem[0];
                    }

                    if ($keyname == "card slot") {
                        $data['card_slot'] = strip_tags($td->innertext);
                    }
                }

                //echo strip_tags($td->innertext) ;
                //echo "\n";
            }
        }

    }
    //exit;
    return $data;
}

//function getNetworks($str)

//$ret = getGSMProduct('http://www.gsmarena.com/samsung_galaxy_win_pro_g3812-5886.php');
$ret = getGSMProduct('http://www.gsmarena.com/microsoft_lumia_640_xl_lte-7087.php');
//print_r($ret);
//var_dump($ret);
productAddDB($ret);


function productAddDB($data)
{
    // wrtie query in for DB
    //var_dump($data);
    //exit;
    $query = "INSERT INTO `products`"
        . " ( `product_name`, `category_id`, `product_type_id`, `brand_id`, `product_alias`, `release_date`, `announce_date`, `sim`, `status`, `date_added`) "
        . "VALUES "
        . "( '" . $data['product_name'] . "', '1', '1', '1', '" . $data['product_name'] . "', '" . $data['announced'] . "', '" . $data['announced'] . "', '" . $data['sim'] . "', '0', CURRENT_TIMESTAMP); ";

    mysql_query($query) or die(mysql_error());
    $productid = mysql_insert_id();

    //mysql_query($batteryQry) or die(mysql_error());
    //mysql_query($bodyQry) or die(mysql_error());
    //mysql_query($cameraQry) or die(mysql_error());


    if (isset($data['gprs'])) {
        if ($data['gprs'] == "Yes") {
            $data['gprs'] = 1;
        } else {
            $data['gprs'] = 0;
        }
    } else {
        $data['gprs'] = 0;
    }
    if (isset($data['edge'])) {
        if ($data['edge'] == "Yes") {
            $data['edge'] = 1;
        } else {
            $data['edge'] = 0;
        }
    } else {
        $data['edge'] = 0;
    }
    if (isset($data['nfc'])) {
        if ($data['nfc'] == "Yes") {
            $data['nfc'] = 1;
        } else {
            $data['nfc'] = 0;
        }
    } else {
        $data['nfc'] = 0;
    }
    if (isset($data['EDGE'])) {
        if ($data['EDGE'] == "Yes") {
            $data['EDGE'] = 1;
        } else {
            $data['EDGE'] = 0;
        }
    } else {
        $data['EDGE'] = 0;
    }

    $batteryQry = "INSERT INTO `gadgets`.`product_battery` "
        . "(`product_id`, `battery`, `standby`, `talktime`) "
        . "VALUES (" . $productid . ", '" . $data['battery'] . "', '" . $data['Stand-by'] . "', '" . $data['talk time'] . "')";

    $bodyQry = "INSERT INTO `gadgets`.`product_body` "
        . "(`product_id`, `dimension`, `weight`)"
        . " VALUES ('" . $productid . "', '" . $data['dimensions'] . "', '" . $data['weight'] . "')";

    $cameraQry = "INSERT INTO `gadgets`.`product_camera` (`product_id`, `primary_cam`, `features`, `video`, `secondary`)"
        . " VALUES ('" . $productid . "', '" . $data['primary'] . "', '" . $data['features'] . "', '" . $data['video'] . "', '" . $data['secondary'] . "');";


    $dataQry = "INSERT INTO `gadgets`.`product_data` "
        . "(`product_id`, `gprs`, `edge`, `speed`, `wlan`, `bluetooth`, `nfc`, `usb`) VALUES "
        . "('" . $productid . "', '" . $data['gprs'] . "', '" . $data['edge'] . "', '" . $data['speed'] . "', '" . $data['wlan'] . "', '" . $data['bluetooth'] . "', '" . $data['nfc'] . "', '" . $data['usb'] . "')";

    $displayQuery = "INSERT INTO `product_display`(`product_id`, `type`, `size`, `multitouch`, `protection`, `display_others`) VALUES ('" . $productid . "','" . $data['type'] . "','" . $data['size'] . "','" . $data['multitouch'] . "','" . $data['protection'] . "','" . $data[''] . "')";

    $featuresQuery = "INSERT INTO `product_features` (`product_id`, `os`, `chipset`, `cpu`, `gpu`, `sensors`, `messaging`, `browser`, `radio`, `gps`, `java`, `colors`, `features_others`) VALUES ('" . $productid . "','" . $data['os'] . "','" . $data['chipset'] . "','" . $data['cpu'] . "','" . $data['gpu'] . "','" . $data['sensors'] . "','" . $data['messaging'] . "','" . $data['browser'] . "','" . $data['radio'] . "','" . $data['gps'] . "','" . $data['java'] . "','" . $data['colors'] . "','NA')";

    $memoryQuery = "INSERT INTO `product_memory`(`product_id`, `card_slot`, `ram`, `internal`) VALUES ('" . $productid . "','" . $data['card_slot'] . "','" . $data['ram'] . "','" . $data['internal'] . "')";

    $miscQuery = "INSERT INTO `product_misc`(`product_id`, `sar_us`, `sar_eu`, `price_group`) VALUES ('" . $productid . "','" . $data['sar eu'] . "','" . $data['sar us'] . "','" . $data['price group'] . "')";

    $soundQuery = "INSERT INTO `product_sound`(`product_id`, `alert_type`, `loudspeaker`, `jack_35mm`) VALUES ('" . $productid . "','" . $data['alert types'] . "','" . $data['loudspeaker'] . "','" . $data['3.5mm jack'] . "')";
}