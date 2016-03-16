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
                        <form action="search.php" method="GET" >
                        <div class="reservation">
                            <ul>
                                <li  class="span1_of_1 desti">
                                    <h5>Flying from</h5>
                                    <div class="book_date">
                                        <select id="depature" name="depature" >
                                            <option value="0">Select a Location</option>
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

                                        <select id="depature" name="destination" >
                                            <option value="0">Select a Destination</option>
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
                                            <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                            <input type="date" id="datepicker" name="dep-date" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}">
                                    </div>
                                </li>
                                <li  class="span1_of_1 left">
                                    <h5>Return</h5>
                                    <div class="book_date">
                                            <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                            <input type="date" id="datepicker1" name="ret-date" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}">
                                    </div>
                                </li>
                                <div class="clearfix"></div>
                                <li class="span1_of_1 economy">
                                    <h5>Class</h5>
                                    <!----------start section_room----------->
                                    <div class="section_room">
                                        <select id="class" name="class" onchange="change_country(this.value)" class="frm-field required">
                                            <option value="e">Economy</option>
                                            <option value="b">Business</option>
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
                                            <input type="submit" name="search" value="Search" />
                                    </div>
                                </li>
                                <div class="clearfix"></div>
                            </ul>
                        </div>
                            </form>
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
                        <form action="search.php" method="GET" >
                            <div class="reservation">
                                <ul>
                                    <li  class="span1_of_1 desti">
                                        <h5>Flying from</h5>
                                        <div class="book_date">
                                            <select id="depature" name="depature">
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

                                            <select id="destination" name="destination" >
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
                                                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                                <input type="date" id="datepicker2" name="dep-date" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}">
                                        </div>
                                    </li>
                                    <div class="clearfix"></div>
                                    <li class="span1_of_1 economy">
                                        <h5>Class</h5>
                                        <!----------start section_room----------->
                                        <div class="section_room">
                                            <select id="country" name="class" onchange="change_country(this.value)" class="frm-field required">
                                                <option value="e">Economy</option>
                                                <option value="b">Business</option>
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
                                            <input type="submit" id="search" name="search" value="Search" />
                                        </div>
                                    </li>
                                    <div class="clearfix"></div>
                                </ul>
                            </div>
                        </form>
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
