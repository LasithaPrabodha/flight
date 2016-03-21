<?php
$editId = $_POST['EID'];

echo '<form class="contact" name="contact">
                                <label class="label" for="email">E-mail</label><br>
                                <input type="email" name="email" class="input-xlarge" value="'.$editId.'"><br>
                                <label class="label" for="subject">Subject</label><br>
                                <input type="text" name="subject" class="input-xlarge" ><br>
                                <label class="label" for="message">Enter a Message</label><br>
                                <textarea name="message" class="input-xlarge"></textarea>
                            </form>';
?>