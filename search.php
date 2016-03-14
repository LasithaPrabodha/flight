
<?PHP include_once('includes/header.php') ?>
<!-- banner -->
<div class="banner">
<!-- container -->
<div class="container">
<div class="col-md-4 banner-left">
    <section class="slider2">
        <div class="flexslider">
            <ul class="slides">
                <li>
                    <div class="slider-info">
                        <img src="images/1.jpg" alt="">
                    </div>
                </li>
                <li>
                    <div class="slider-info">
                        <img src="images/2.jpg" alt="">
                    </div>
                </li>
                <li>
                    <div class="slider-info">
                        <img src="images/3.jpg" alt="">
                    </div>
                </li>
                <li>
                    <div class="slider-info">
                        <img src="images/4.jpg" alt="">
                    </div>
                </li>
                <li>
                    <div class="slider-info">
                        <img src="images/2.jpg" alt="">
                    </div>
                </li>
            </ul>
        </div>
    </section>
    <!--FlexSlider-->
</div>
<div class="col-md-8 banner-right">
<div class="sap_tabs">
<div class="booking-info">
    <h2>Book Domestic & International Flight Tickets</h2>
</div>
<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
<ul class="resp-tabs-list">
    <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Return</span></li>
    <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>One way</span></li>
    <div class="clearfix"></div>
</ul>
<!---->
<div class="resp-tabs-container">
<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
    <div class="facts">
        <div class="booking-form">
            <!---strat-date-piker---->
            <script>
                $(function() {
                    $( "#datepicker,#datepicker1,#datepicker2" ).datepicker();
                });
            </script>
            <!---/End-date-piker---->
            <!-- Set here the key for your domain in order to hide the watermark on the web server -->

            <div class="online_reservation">
                <div class="b_room">
                    <div class="booking_room">
                        <div class="reservation">
                            <ul>
                                <li  class="span1_of_1 desti">
                                    <h5>Flying from</h5>
                                    <div class="book_date">
                                        <select id="depature" name="depature" class="form-control">
                                            <option value="0">Any</option>
                                            <?php  $sql = "SELECT DISTINCT depature FROM flights";
                                            $rs = $conexion->query($sql);
                                            $rows = $rs->fetch_all();
                                            if (!empty($rows)){
                                                foreach ($rows as $row) {
                                                    ?>
                                                    <option value="<?php echo $row[0] ?>"><?php echo $row[0] ?></option>
                                                <?php }} ?>

                                        </select>

                                    </div>
                                </li>
                                <li  class="span1_of_1 left desti">
                                    <h5>Flying to</h5>
                                    <div class="book_date">

                                        <select id="depature" name="depature" class="form-control">
                                            <option value="0">Any</option>
                                            <?php  $sql = "SELECT DISTINCT destination FROM flights";
                                            $rs = $conexion->query($sql);
                                            $rows = $rs->fetch_all();
                                            if (!empty($rows)) {
                                                foreach ($rows as $row) {
                                                    ?>
                                                    <option value="<?php echo $row[0] ?>"><?php echo $row[0] ?></option>
                                                <?php }} ?>

                                        </select>
                                    </div>
                                </li>
                                <div class="clearfix"></div>
                            </ul>
                        </div>
                        <div class="reservation">
                            <ul>
                                <li  class="span1_of_1">
                                    <h5>Departure</h5>
                                    <div class="book_date">
                                        <form>
                                            <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                            <input type="date" id="datepicker" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}">
                                        </form>
                                    </div>
                                </li>
                                <li  class="span1_of_1 left">
                                    <h5>Return</h5>
                                    <div class="book_date">
                                        <form>
                                            <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                            <input type="date" id="datepicker1" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}">
                                        </form>
                                    </div>
                                </li>
                                <li class="span1_of_1 left adult">
                                    <h5>Adults (18+)</h5>
                                    <!----------start section_room----------->
                                    <div class="section_room">
                                        <select id="country" onchange="change_country(this.value)" class="frm-field required">
                                            <option value="null">1</option>
                                            <option value="null">2</option>
                                            <option value="AX">3</option>
                                            <option value="AX">4</option>
                                            <option value="AX">5</option>
                                            <option value="AX">6</option>
                                        </select>
                                    </div>
                                </li>
                                <li class="span1_of_1 left children">
                                    <h5>Children (0-17)</h5>
                                    <!----------start section_room----------->
                                    <div class="section_room">
                                        <select id="country" onchange="change_country(this.value)" class="frm-field required">
                                            <option value="null">1</option>
                                            <option value="null">2</option>
                                            <option value="AX">3</option>
                                            <option value="AX">4</option>
                                            <option value="AX">5</option>
                                            <option value="AX">6</option>
                                        </select>
                                    </div>
                                </li>
                                <li class="span1_of_1 economy">
                                    <h5>Class</h5>
                                    <!----------start section_room----------->
                                    <div class="section_room">
                                        <select id="country" onchange="change_country(this.value)" class="frm-field required">
                                            <option value="null">Economy</option>
                                            <option value="null">Business</option>
                                        </select>
                                    </div>
                                </li>
                                <div class="clearfix"></div>
                            </ul>
                        </div>
                        <div class="reservation">
                            <ul>
                                <li class="span1_of_3">
                                    <div class="date_btn">
                                        <form>
                                            <input type="submit" value="Search" />
                                        </form>
                                    </div>
                                </li>
                                <div class="clearfix"></div>
                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!---->
        </div>
    </div>
</div>
<div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
    <div class="facts">
        <div class="booking-form">
            <!---strat-date-piker---->
            <link rel="stylesheet" href="css/jquery-ui.css" />
            <script src="js/jquery-ui.js"></script>
            <script>
                $(function() {
                    $( "#datepicker,#datepicker1,#datepicker2" ).datepicker();
                });
            </script>

            <!---/End-date-piker---->
            <div class="online_reservation">
                <div class="b_room">
                    <div class="booking_room">
                        <div class="reservation">
                            <ul>
                                <li  class="span1_of_1 desti">
                                    <h5>Flying from</h5>
                                    <div class="book_date">
                                        <select id="depature" name="depature" class="form-control">
                                            <option value="0">Any</option>
                                            <?php  $sql = "SELECT DISTINCT depature FROM flights";
                                            $rs = $conexion->query($sql);
                                            $rows = $rs->fetch_all();
                                            if (!empty($rows)){
                                                foreach ($rows as $row) {
                                                    ?>
                                                    <option value="<?php echo $row[0] ?>"><?php echo $row[0] ?></option>
                                                <?php }} ?>

                                        </select>

                                    </div>
                                </li>
                                <li  class="span1_of_1 left desti">
                                    <h5>Flying to</h5>
                                    <div class="book_date">

                                        <select id="depature" name="depature" class="form-control">
                                            <option value="0">Any</option>
                                            <?php  $sql = "SELECT DISTINCT destination FROM flights";
                                            $rs = $conexion->query($sql);
                                            $rows = $rs->fetch_all();
                                            if (!empty($rows)) {
                                                foreach ($rows as $row) {
                                                    ?>
                                                    <option value="<?php echo $row ?>"><?php echo $row[0] ?></option>
                                                <?php }} ?>

                                        </select>
                                    </div>
                                </li>
                                <div class="clearfix"></div>
                            </ul>
                        </div>
                        <div class="reservation">
                            <ul>
                                <li  class="span1_of_1">
                                    <h5>Departure</h5>
                                    <div class="book_date">
                                        <form>
                                            <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                            <input type="date" id="datepicker2" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}">
                                        </form>
                                    </div>
                                </li>
                                <li class="span1_of_1 left">
                                    <h5>Adults (18+)</h5>
                                    <!----------start section_room----------->
                                    <div class="section_room">
                                        <select id="country" onchange="change_country(this.value)" class="frm-field required">
                                            <option value="null">1</option>
                                            <option value="null">2</option>
                                            <option value="AX">3</option>
                                            <option value="AX">4</option>
                                            <option value="AX">5</option>
                                            <option value="AX">6</option>
                                        </select>
                                    </div>
                                </li>
                                <li class="span1_of_1 left tab-children">
                                    <h5>Children (0-17)</h5>
                                    <!----------start section_room----------->
                                    <div class="section_room">
                                        <select id="country" onchange="change_country(this.value)" class="frm-field required">
                                            <option value="null">1</option>
                                            <option value="null">2</option>
                                            <option value="AX">3</option>
                                            <option value="AX">4</option>
                                            <option value="AX">5</option>
                                            <option value="AX">6</option>
                                        </select>
                                    </div>
                                </li>
                                <li class="span1_of_1 economy">
                                    <h5>Class</h5>
                                    <!----------start section_room----------->
                                    <div class="section_room">
                                        <select id="country" onchange="change_country(this.value)" class="frm-field required">
                                            <option value="null">Economy</option>
                                            <option value="null">Business</option>
                                        </select>
                                    </div>
                                </li>
                                <div class="clearfix"></div>
                            </ul>
                        </div>
                        <div class="reservation">
                            <ul>
                                <li class="span1_of_3">
                                    <div class="date_btn">
                                        <form>
                                            <input type="submit" value="Search" />
                                        </form>
                                    </div>
                                </li>
                                <div class="clearfix"></div>
                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!---->
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
<div class="clearfix"> </div>


</div>
<!-- //container -->
</div>
<div class="search-res col-md-12">

    <?php  $sql = "SELECT DISTINCT destination FROM flights";
    $rs = $conexion->query($sql);
    $rows = $rs->fetch_all();
    if (!empty($rows)) {
        foreach ($rows as $row) {
            ?>
            <div class="col-md-8 col-md-offset-2" style="background: #FFF;padding: 1em; box-shadow: 0 0 1px #CECECE; ">
                    <div class="">
                        <h5>New Hotel Experiences at Your Favourite Destinations</h5>
                        <p>Integer eget aliquam nibh. Donec blandit volutpat libero id lacinia</p>
                        <p class="b-period">Book Period: Now - 7 September 2015 | Travel Period: Now - 31 October 2015 </p>
                    </div>
            </div>

        <?php }} ?>


</div>

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