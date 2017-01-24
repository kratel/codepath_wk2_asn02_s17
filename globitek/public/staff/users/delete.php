<?php
require_once('../../../private/initialize.php');

if(!isset($_GET['id'])) {
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

  $result = delete_user($user);
  if($result === true) {
    redirect_to('index.php'); //sanitize
  } else {
    $errors = $result;
  }
}
?>
<?php $page_title = 'Staff: Edit User ' . h($cur_user['first_name']) . " " . h($cur_user['last_name']); ?> <!-- sanitize -->
<?php include(SHARED_PATH . '/header.php'); ?>

<div id="main-content">
  <a href="index.php">Back to Users List</a><br />

  <h1>Delete User: <?php echo h($cur_user['first_name']) . " " . h($cur_user['last_name']); ?></h1> <!-- sanitize -->

  <?php echo display_errors($errors); ?>
  <p>Are You Sure You Want to <b>Permanently Delete</b> This User?</p>

  <!-- <form action="edit.php?id=<?php //echo $user['id']; ?>" method="post">  -->
  <form action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]."?id=". u($user['id'])); ?> method = "post"> <!--sanitize -->
    <br />
    <input type="submit" name="submit" value="DELETE"  />
  </form>

</div>

<?php include(SHARED_PATH . '/footer.php'); ?>
