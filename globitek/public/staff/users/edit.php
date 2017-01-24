<?php
require_once('../../../private/initialize.php');

if(!isset($_GET['id']) || is_blank($_GET['id'])) {
  redirect_to('index.php');
}
$users_result = find_user_by_id($_GET['id']); //sanitize
// No loop, only one result
$user = db_fetch_assoc($users_result);

// Set default values for all variables the page needs.
$errors = array();
$cur_user = array(
  'first_name' => '',
  'last_name' => ''
);

$cur_user['first_name'] = h($user['first_name']);
$cur_user['last_name'] = h($user['last_name']);

if(is_post_request()) {

  // Confirm that values are present before accessing them.
  if(isset($_POST['first_name'])) { $user['first_name'] = h($_POST['first_name']); }
  if(isset($_POST['last_name'])) { $user['last_name'] = h($_POST['last_name']); }
  if(isset($_POST['username'])) { $user['username'] = h($_POST['username']); }
  if(isset($_POST['email'])) { $user['email'] = h($_POST['email']); }


  $result = update_user($user);
  if($result === true) {
    redirect_to('show.php?id=' . raw_u($user['id'])); //sanitize
  } else {
    $errors = $result;
  }
}
?>
<?php $page_title = 'Staff: Edit User ' . h($cur_user['first_name']) . " " . h($cur_user['last_name']); ?> <!-- sanitize -->
<?php include(SHARED_PATH . '/header.php'); ?>

<div id="main-content">
  <a href="index.php">Back to Users List</a><br />

  <h1>Edit User: <?php echo h($cur_user['first_name']) . " " . h($cur_user['last_name']); ?></h1> <!-- sanitize -->

  <?php echo display_errors($errors); ?>

  <!-- <form action="edit.php?id=<?php //echo $user['id']; ?>" method="post">  -->
  <form action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]."?id=". u($user['id'])); ?> method = "post"> <!--sanitize -->
    First name:<br />
    <input type="text" name="first_name" value="<?php echo h($user['first_name']); ?>" /><br />
    Last name:<br />
    <input type="text" name="last_name" value="<?php echo h($user['last_name']); ?>" /><br />
    Username:<br />
    <input type="text" name="username" value="<?php echo h($user['username']); ?>" /><br />
    Email:<br />
    <input type="text" name="email" value="<?php echo h($user['email']); ?>" /><br />
    <br />
    <input type="submit" name="submit" value="Update"  />
  </form>

</div>

<?php include(SHARED_PATH . '/footer.php'); ?>
