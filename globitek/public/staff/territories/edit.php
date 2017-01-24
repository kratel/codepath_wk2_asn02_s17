<?php
require_once('../../../private/initialize.php');

if(!isset($_GET['id'])) {
  redirect_to('index.php');
}
$territories_result = find_territory_by_id($_GET['id']);
// No loop, only one result
$territory = db_fetch_assoc($territories_result);
//init vars
$errors = array();
$cur_territory = array(
  'name' => ''
);
$cur_territory['name'] = h($territory['name']);

if(is_post_request()) {

  // Confirm that values are present before accessing them.
  if(isset($_POST['name'])) { $territory['name'] = ucfirst(h($_POST['name'])); } // sanititze capitalize first letter in case user did not
  if(isset($_POST['position'])) { $territory['position'] = h($_POST['position']); } // sanititze


  $result = update_territory($territory);
  if($result === true) {
    redirect_to('show.php?id=' . raw_u($territory['id'])); // sanitize
  } else {
    $errors = $result;
  }
}

?>
<?php $page_title = 'Staff: Edit Territory ' . h($cur_territory['name']); ?>
<?php include(SHARED_PATH . '/header.php'); ?>

<div id="main-content">
  <a href="../states/show.php?id=<?php echo u($territory['state_id']); ?>">Back to State Details</a><br />

  <h1>Edit Territory: <?php echo h($cur_territory['name']); ?></h1>

  <?php echo display_errors($errors); ?>

  <!-- TODO add form -->

  <form action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]."?id=". u($territory['id'])); ?> method = "post"> <!--sanitize -->
    Name:<br />
    <input type="text" name="name" value="<?php echo h($territory['name']); ?>" /><br />
    Position:<br />
    <input type="text" name="position" value="<?php echo h($territory['position']); ?>" /><br />
    <br />
    <input type="submit" name="submit" value="Update"  />
  </form>
  <br />
  <a href="../territories/show.php?id=<?php echo raw_u($territory['id']);?>">Cancel</a><br />

</div>

<?php include(SHARED_PATH . '/footer.php'); ?>
