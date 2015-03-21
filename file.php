<?php
/// this file will get the  product html files for the


ini_set("display_error", 1);
ini_set("max_execution_time", 30000);
/**
 * Created by PhpStorm.
 * User: Naveen
 * Date: 12/14/14
 * Time: 6:33 PM
 */
include_once 'config.php';
include_once 'simple_html_dom.php';
include_once 'simple_html_dom_utility.php';

//$html = str_get_html($brantsStr);
//echo "<pre>";
$html = file_get_html('http://www.gsmarena.com/');
$category = array();

foreach ($html->find('div#brandmenu') as $ul) {
    foreach ($ul->find('li') as $li) {
        $link = str_get_html($li->innertext);
        $href = $link->find('a');
         //var_dump($href[0]->attr['href']);
        //var_dump(strip_tags($link->innertext)); exit;
        $brand = strip_tags($link->innertext);
        $category[$brand] = "http://www.gsmarena.com/" . $href[0]->attr['href'];
        //echo "<br>";
        //exit;
    }

    //print_r($category);
    //echo $li->href;

    //exit;
}


getAllProductLinks($category);


/***
 * @param   $url
 * @return array
 *
 */

function getAllProductLinks($urls){
    $productLinks=array();
    foreach($urls as $url){
        $brands = getPagingLinks($url);
        foreach($brands as $brandUrl){
            $brandPages = getPagingLinks($brandUrl);
            //foreach($brandPages as $brandPageUrl) {
                $productLinks[] =  getPhoneLinks($brandPages);
           // }
        }
    }
    echo "<pre>";
    print_r($productLinks); exit;
    return $productLinks;
}



//$html2 = file_get_html('http://www.gsmarena.com/motorola-phones-4.php');
//$html2->find('div.nav-pages')

/// for finding page links on the first brand page
function getPagingLinks($url){
    $html = file_get_html($url);
    $pageLinks=array();
    $pageLinks[]=$url;
    foreach($html->find('div.nav-pages') as $link){
         foreach($link->find('a') as $url ){
            //var_dump($url->attr['href']); exit;
            $pageLinks[] = "http://www.gsmarena.com/" .$url->attr['href'];
        }
    }
    //print_r($pageLinks);
    //exit;
    return $pageLinks;
}


/****
 * get all the links on the of the brand
 * @params  array of the first pages of the brands
 * @return  array of the pages of the brands
 */

function getAllBrandPages($urls=array()){
    $pageUrls = array();
    foreach($urls as $brand=>$url ){
        //$pageUrls[$brand][] = $url;
        $pageUrls[$brand] = getPagingLinks($url);
    }
    /*echo("<pre>");
    print_r($pageUrls);
    exit;*/
    return $pageUrls;
}



//getPhoneLinks($category);

/**
 * @param $category
 * @return array of urls the product pages
 *
 */
function getPhoneLinks($category)
{
    $phoneLinks = array();
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
    //echo  "<pre>";
    //print_r($phoneLinks);
    return $phoneLinks;

}

