<?php
require_once('../../../private/initialize.php');

if(!isset($_GET['id']) || is_blank($_GET['id'])) {
  redirect_to('index.php');
}
$countries_result = find_country_by_id($_GET['id']);
// No loop, only one result
$country = db_fetch_assoc($countries_result);

//init vars
$errors = array();
$cur_country = array(
  'name' => ''
);
$cur_country['name'] = h($country['name']);

if(is_post_request()) {

  // Confirm that values are present before accessing them.
  if(isset($_POST['name'])) { $country['name'] = ucfirst(h($_POST['name'])); } //sanitize
  if(isset($_POST['code'])) { $country['code'] = strtoupper(h($_POST['code'])); } // sanitize


  $result = update_country($country);
  if($result === true) {
    redirect_to('show.php?id=' . raw_u($country['id'])); // sanitize
  } else {
    $errors = $result;
  }
}
?>
<?php $page_title = 'Staff: Edit Country ' . h($cur_country['name']); ?>
<?php include(SHARED_PATH . '/header.php'); ?>

<div id="main-content">
  <a href="index.php">Back to Countries List</a><br />

  <h1>Edit Country: <?php echo h($cur_country['name']); ?></h1>

  <?php echo display_errors($errors); ?>

  <!-- TODO add form -->
  <form action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]."?id=". u($country['id'])); ?> method = "post"> <!--sanitize -->
    Name:<br />
    <input type="text" name="name" value="<?php echo h($country['name']); ?>" /><br />
    Code:<br />
    <input type="text" name="code" value="<?php echo h($country['code']); ?>" /><br />
    <br />
    <input type="submit" name="submit" value="Update"  />
  </form>
  <br />
  <a href="show.php?id=<?php echo raw_u($country['id']); ?>">Cancel</a><br /> <!-- sanitize -->

</div>

<?php include(SHARED_PATH . '/footer.php'); ?>
