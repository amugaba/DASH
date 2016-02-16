<?php
include_once 'UserVO.php';
include_once 'ConnectionManager.php';
require_once 'MailHelper.php';

class UserService

{
    var $tablename = "users";
    public $connection;

    public function __construct ()
    {
		$cm = new ConnectionManager();

        $this->connection = mysqli_connect($cm->server, $cm->username,
        $cm->password, $cm->databasename, $cm->port);

        $this->throwExceptionOnError($this->connection);
    }
    
    /**
	 * 
	 * Login user
	 * 
	 * @param string $username
	 * @param string $password
	 * @return UserVO
	 */
    public function loginUser($username, $password)
    {
    	$stmt = $this->connection->prepare("SELECT
        	autoid, username, name, password, email, eulaSigned, admin 
           FROM $this->tablename WHERE username=? AND password=?");
        $this->throwExceptionOnError();
        
        $stmt->bind_param('ss', $username, $password);
        $this->throwExceptionOnError();
        
        $stmt->execute();
        $this->throwExceptionOnError();

        $obj = new UserVO();
        
        $stmt->bind_result($obj->autoid, $obj->username, $obj->name, $obj->password, $obj->email, $obj->eulaSigned, $obj->admin);
        
        $auth = $stmt->fetch();
        
        mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
        
        if($auth)
        	return $obj;
        else return null;  
    }
    
    /**
	 * 
	 * Get users
	 * 
	 * @return UserVO[]
	 */
    public function getUsers()
    {
    	$stmt = $this->connection->prepare("SELECT autoid, username, name, email, eulaSigned, admin, adminid FROM $this->tablename");
    	$this->throwExceptionOnError();
    	
    	$stmt->execute();
    	$this->throwExceptionOnError();
    	
    	$users = array();
    	
    	$obj = new UserVO();
    	$stmt->bind_result($obj->autoid, $obj->username, $obj->name, $obj->email, $obj->eulaSigned, $obj->admin, $obj->adminid);
    	
    	while ($stmt->fetch()) 
    	{
            $users[] = $obj;
            $obj = new UserVO();
    		$stmt->bind_result($obj->autoid, $obj->username, $obj->name, $obj->email, $obj->eulaSigned, $obj->admin, $obj->adminid);
        }
    	
    	mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
        
        return $users;
    }
    
    /**
     * Sign EULA
     * 
     * @param int $userid
     */
    public function signEULA($userid)
    {
    	$stmt = $this->connection->prepare("UPDATE $this->tablename SET eulaSigned=1 WHERE autoid=?");
    	$this->throwExceptionOnError();
    	
    	$stmt->bind_param('i', $userid);
        $this->throwExceptionOnError();
    	
    	$stmt->execute();
    	$this->throwExceptionOnError();
    	
    	mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
    }
    
    /**
	 *
	 * Email forgotten password to user
	 *
	 * @param string $username
	 * @return bool
	 */
    public function emailPassword($username)
    {
        $stmt = $this->connection->prepare("SELECT
        	password, email
           FROM $this->tablename WHERE username=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('s', $username);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();
		
        $pw = "";
        $email = "";
        $stmt->bind_result($pw, $email);

        $auth = $stmt->fetch();

        mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
        
        //email password to user
        $mailer = new MailHelper('SBIRT Dash System: Password Recovery');
        $mailer->setBody('<p>Your password is <b>'.pw.'</b></p>');
        return $mailer->sendMail($user->email,'User');//returns whether the mail was sent successfully
    }
    
	/**
	 * Utility function to throw an exception if an error occurs 
	 * while running a mysql command.
	 */
	private function throwExceptionOnError($link = null) {
		if($link == null) {
			$link = $this->connection;
		}
		if(mysqli_error($link)) {
			$msg = mysqli_errno($link) . ": " . mysqli_error($link);
			throw new Exception('MySQL Error - '. $msg);
		}		
	}
}

?>