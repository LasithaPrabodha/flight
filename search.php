
<?PHP include_once('includes/header.php')
?>
<!-- banner -->
<div class="banner">
<!-- container -->
<div class="container">
    <?PHP include_once('includes/widget-small.php') ?>

<div class="clearfix"> </div>


</div>
<!-- //container -->
</div>



    <?php
    if(isset($_GET['search'])){

        if($_GET['depature'] =='0' || $_GET['depature']== '0' ||  $_GET['dep-date']== "Select date"){
            $message = '<div class="alert alert-danger"> Please Select Departure location, Destination and Departure Date</div>';
            echo $message;
        }else{ ?>

            <div class="search-res col-md-12">
                <div class="col-md-8 col-md-offset-2" style="margin-top: 20px; margin-bottom: 10px">
                    <h3>Here are The flights we found for you!</h3>
                </div>

            <?php
            $dep =$_GET['depature'];
            $dest =$_GET['destination'];
            $class =  $_GET['class'];
            $dept_date =str_replace('/','-',$_GET['dep-date']);
            $sql = "SELECT * from flights WHERE depature='". $dep ."' AND destination='" . $dest . "' AND depature_date >" . $dept_date;


            $rs = $conexion->query($sql);
            $rows = $rs->fetch_all();
            if (!empty($rows)) {
                foreach ($rows as $row) {
                    ?>
                    <div class="col-md-8 col-md-offset-2" style="background: #ffffff;padding: 1em; margin-top: 10px; box-shadow: 0 0 1px #CECECE; ">
                            <div class="">
                                <div class="col-md-12">
                                    <div class="col-md-3" style="padding: 5px ;margin: 0"><?php echo $row[3] ?></div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0">To</div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0"><?php echo $row[4] ?></div>
                                    <div class="col-md-3">
                                        <div class="date_btn pull-right" style="margin-top: 0px">
                                            <form action="seats.php" method="get">
                                                <input type="text" hidden="hidden" name="flight_id" value="<?php echo $row[0] ?>"/>
                                                <input type="text" hidden="hidden" name="class" value="<?php echo $class ?>"/>
                                                <input type="submit" value="Book Now!" />
                                            </form>

                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-md-12" >
                                    <div class="col-md-2" style="background: #F4F7F9; padding: 5px ;margin: 0">Airlines :</div>
                                    <div class="col-md-3" style="background: #F4F7F9; padding: 5px ;margin: 0"><?php echo $row[2] ?></div>
                                    <div class="col-md-2" style="background: #F4F7F9; padding: 5px ;margin: 0">|     Departure :</div>
                                    <div class="col-md-3" style="background: #F4F7F9; padding: 5px ;margin: 0: 4px"><?php echo $row[5] ?></div>
                                    <div class="col-md-2" ></div>
                                </div>
                                <div class="col-md-12" >
                                    <div class="col-md-2" style="padding: 5px ;margin: 0">Business (Adult) :</div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0"><?php echo $row[6] ?></div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0">|     Business (Children) :</div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0: 4px">35000</div>
                                    <div class="col-md-1" ></div>
                                </div>
                                <div class="col-md-12" >
                                    <div class="col-md-2" style="padding: 5px ;margin: 0">Economy (Adult) :</div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0"><?php echo $row[9] ?></div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0">|     Economy (Children) :</div>
                                    <div class="col-md-3" style="padding: 5px ;margin: 0: 4px">35000</div>
                                    <div class="col-md-1" ></div>
                                </div>
                            </div>
                    </div>

                <?php }}}} echo "</div>"  ?>




<!-- popular-grids -->
<div class="popular-grids">
    <div class="clearfix"> </div>
    <!-- container -->
    <div class="container">
        <div class="popular-info">
            <h3>Popular Places</h3>
        </div>
        <!-- slider -->
        <div class="slider">
            <div class="arrival-grids">
                <ul id="flexiselDemo1">
                    <li>
                        <a href="products.html"><img src="images/a3.jpg" alt=""/>
                        </a>
                    </li>
                    <li>
                        <a href="products.html"><img src="images/a2.jpg" alt=""/>
                        </a>
                    </li>
                    <li>
                        <a href="products.html"><img src="images/a4.jpg" alt=""/>
                        </a>
                    </li>
                    <li>
                        <a href="products.html"><img src="images/a1.jpg" alt=""/>
                        </a>
                    </li>
                </ul>
                <script type="text/javascript">
                    $(window).load(function() {
                        $("#flexiselDemo1").flexisel({
                            visibleItems: 4,
                            animationSpeed: 1000,
                            autoPlay: true,
                            autoPlaySpeed: 3000,
                            pauseOnHover:true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint:480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint:640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint:768,
                                    visibleItems: 3
                                }
                            }
                        });
                    });
                </script>
                <script type="text/javascript" src="js/jquery.flexisel.js"></script>
            </div>
        </div>
        <!-- //slider -->
    </div>
    <!-- //container -->
</div>
<!-- popular-grids -->

<?php include_once 'includes/footer.php'; ?>