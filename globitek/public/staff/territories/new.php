<?php
require_once('../../../private/initialize.php');

//get state id
if(!isset($_GET['sid']) || is_blank($_GET['sid'])) {
  redirect_to('index.php');
} else {
	$state_id = h($_GET['sid']);  // Very Vulnerable
}
//Init vars and errors array
$errors = array();
$territory = array(
  'name' => '',
  'position' => '',
  'state_id' => ''
);

if(is_post_request()) {

  // Confirm that values are present before accessing them.
  if(isset($_POST['name'])) { $territory['name'] = ucfirst(h($_POST['name'])); } // sanititze capitalize first letter in case user did not
  if(isset($_POST['position'])) { $territory['position'] = h($_POST['position']); } // sanititze
  if(isset($_GET['sid']) && ($state_id == $_GET['sid'])) { $territory['state_id'] = $state_id ;} // sanitize
  else { $errors[] = "Unauthorized modification to state id detected";}

  $result = insert_territory($territory);
  if($result === true) {
    $new_id = db_insert_id($db);
    redirect_to('show.php?id=' . raw_u($new_id));
  } else {
    $errors = $result;
  }
}

?>
<?php $page_title = 'Staff: New Territory'; ?>
<?php include(SHARED_PATH . '/header.php'); ?>

<div id="main-content">
  <a href="../states/show.php?id=<?php echo raw_u($state_id); ?>">Back to State Details</a><br />

  <h1>New Territory</h1>

  <?php echo display_errors($errors); ?>

  <!-- TODO add form -->

  <form action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]."?sid=". u($state_id)); ?> method = "post"> <!--sanitize -->
    Name:<br />
    <input type="text" name="name" value="<?php echo h($territory['name']); ?>" /><br />
    Position:<br />
    <input type="text" name="position" value="<?php echo h($territory['position']); ?>" /><br />
    <br />
    <input type="submit" name="submit" value="Create"  />
  </form>
  <br />
  <a href="index.php">Back to Main Menu</a><br />

</div>

<?php include(SHARED_PATH . '/footer.php'); ?>
