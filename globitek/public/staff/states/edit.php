<?php
require_once('../../../private/initialize.php');

if(!isset($_GET['id'])) {
  redirect_to('index.php');
}
$states_result = find_state_by_id($_GET['id']);
// No loop, only one result
$state = db_fetch_assoc($states_result);

//init vars
$errors = array();
$cur_state = array(
  'name' => ''
);
$cur_state['name'] = h($state['name']);

if(is_post_request()) {

  // Confirm that values are present before accessing them.
  if(isset($_POST['name'])) { $state['name'] = ucfirst(h($_POST['name'])); } //sanitize
  if(isset($_POST['code'])) { $state['code'] = strtoupper(h($_POST['code'])); } // sanitize


  $result = update_state($state);
  if($result === true) {
    redirect_to('show.php?id=' . raw_u($state['id'])); // sanitize
  } else {
    $errors = $result;
  }
}
?>
<?php $page_title = 'Staff: Edit State ' . h($cur_state['name']); ?>
<?php include(SHARED_PATH . '/header.php'); ?>

<div id="main-content">
  <a href="show.php?id=<?php echo raw_u($state['id']); ?>">Back to State Details</a><br />

  <h1>Edit State: <?php echo h($cur_state['name']); ?></h1>

  <?php echo display_errors($errors); ?>

  <!-- TODO add form -->
  <form action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]."?id=". u($state['id'])); ?> method = "post"> <!--sanitize -->
    Name:<br />
    <input type="text" name="name" value="<?php echo h($state['name']); ?>" /><br />
    Code:<br />
    <input type="text" name="code" value="<?php echo h($state['code']); ?>" /><br />
    <br />
    <input type="submit" name="submit" value="Update"  />
  </form>
  <br />
  <a href="show.php?id=<?php echo raw_u($state['id']); ?>">Cancel</a><br /> <!-- sanitize -->

</div>

<?php include(SHARED_PATH . '/footer.php'); ?>
