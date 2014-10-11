<?php
$cur_path = getcwd().DIRECTORY_SEPARATOR;
echo $cur_path."\n";

$del_month_names = array("Jun","May","Apr","Mar","Feb","Jan");
if ($dh = opendir($cur_path)) {
    while (($file = readdir($dh)) !== false) {
        $all_f = $cur_path . $file;
        //echo $all_f."\n";
        $f_month = `ls -l $all_f | awk '{print $6}'`;
 //       echo "f_month = $f_month\n";
        //continue;
//var_dump(is_file($all_f));
//var_dump(in_array(trim($f_month),$del_month_names));
        if(is_file($all_f) && in_array(trim($f_month),$del_month_names)){
            echo "f_month = ".trim($f_month)."\n";
            echo $all_f."\n\n";
            `rm -f $all_f`;
            //echo "filename: $file : filetype: " . filetype($all_f) . "\n";
        }else{
           // echo "$all_f is not file\n";
        }
    }
    closedir($dh);
}
