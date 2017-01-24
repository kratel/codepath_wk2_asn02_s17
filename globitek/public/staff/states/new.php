<?php
require_once('../../../private/initialize.php');

//get country id
if(!isset($_GET['cid'])|| is_blank($_GET['cid'])) {
  redirect_to('index.php');
} else {
  $country_id = h($_GET['cid']);  // Very Vulnerable
}
//Init vars and errors array
$errors = array();
$state = array(
  'name' => '',
  'code' => '',
  'country_id' => ''
);

if(is_post_request()) {

  // Confirm that values are present before accessing them.
  if(isset($_POST['name'])) { $state['name'] = ucfirst(h($_POST['name'])); } // Make first letter capital in case user did not  Sanitize
  if(isset($_POST['code'])) { $state['code'] = strtoupper(h($_POST['code'])); } // Capitalize all letters in case user did not  Sanitize
  if(isset($_GET['cid']) && ($country_id == $_GET['cid'])) { $state['country_id'] = $country_id ;} // sanitize
  else { $errors[] = "Unauthorized modification to country id detected";}

  $result = insert_state($state);
  if($result === true) {
    $new_id = db_insert_id($db);
    redirect_to('show.php?id=' . raw_u($new_id));
  } else {
    $errors = $result;
  }
}

?>
<?php $page_title = 'Staff: New State'; ?>
<?php include(SHARED_PATH . '/header.php'); ?>

<div id="main-content">
  <a href="../countries/show.php?id=<?php echo raw_u($country_id) ?>">Back to Country Details</a><br />

  <h1>New State</h1>

  <?php echo display_errors($errors); ?>

  <!-- TODO add form -->

  <form action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]."?cid=". u($country_id)); ?> method = "post"> <!--sanitize -->
    Name:<br />
    <input type="text" name="name" value="<?php echo h($state['name']); ?>" /><br />
    Code:<br />
    <input type="text" name="code" value="<?php echo h($state['code']); ?>" /><br />
    <br />
    <input type="submit" name="submit" value="Create"  />
  </form>
  <br />
  <a href="index.php">Back to Main Menu</a><br />

</div>

<?php include(SHARED_PATH . '/footer.php'); ?>
