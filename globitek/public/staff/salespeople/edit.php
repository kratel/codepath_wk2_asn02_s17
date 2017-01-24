<?php
require_once('../../../private/initialize.php');

if(!isset($_GET['id'])) {
  redirect_to('index.php');
}
$salespeople_result = find_salesperson_by_id($_GET['id']); //sanitize
// No loop, only one result
$salesperson = db_fetch_assoc($salespeople_result);

//init vars
$errors = array();
$cur_salesperson = array(
  'first_name' => '',
  'last_name' => ''
);

$cur_salesperson['first_name'] = h($salesperson['first_name']);
$cur_salesperson['last_name'] = h($salesperson['last_name']);

if(is_post_request()) {

  // Confirm that values are present before accessing them.
  if(isset($_POST['first_name'])) { $salesperson['first_name'] = h($_POST['first_name']); }
  if(isset($_POST['last_name'])) { $salesperson['last_name'] = h($_POST['last_name']); }
  if(isset($_POST['phone'])) { $salesperson['phone'] = h($_POST['phone']); }
  if(isset($_POST['email'])) { $salesperson['email'] = h($_POST['email']); }


  $result = update_salesperson($salesperson);
  if($result === true) {
    redirect_to('show.php?id=' . raw_u($salesperson['id'])); // sanitize
  } else {
    $errors = $result;
  }
}
?>
<?php $page_title = 'Staff: Edit Salesperson ' . h($cur_salesperson['first_name']) . " " . h($cur_salesperson['last_name']); ?> <!-- sanitize-->
<?php include(SHARED_PATH . '/header.php'); ?>

<div id="main-content">
  <a href="index.php">Back to Salespeople List</a><br />

  <h1>Edit Salesperson: <?php echo h($cur_salesperson['first_name']) . " " . h($cur_salesperson['last_name']); ?></h1> <!-- sanitize-->

  <?php echo display_errors($errors); ?>

  <!-- TODO add form -->
  <form action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]."?id=". u($salesperson['id'])); ?> method = "post"> <!--sanitize -->
  	First name:<br />
    <input type="text" name="first_name" value="<?php echo h($salesperson['first_name']); ?>" /><br />
    Last name:<br />
    <input type="text" name="last_name" value="<?php echo h($salesperson['last_name']); ?>" /><br />
    Phone:<br />
    <input type="text" name="phone" value="<?php echo h($salesperson['phone']); ?>" /><br />
    Email:<br />
    <input type="text" name="email" value="<?php echo h($salesperson['email']); ?>" /><br />
    <br />
    <input type="submit" name="submit" value="Update"  />
  </form>
  <br />
  <a href="show.php?id=<?php echo raw_u($salesperson['id']); ?>">Cancel</a><br /> <!-- sanitize -->


</div>

<?php include(SHARED_PATH . '/footer.php'); ?>
