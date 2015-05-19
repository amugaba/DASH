<?php
include_once 'UserVO.php';
	require_once('Zend/Mail/Transport/Smtp.php');
	require_once 'Zend/Mail.php';


class UserService

{
/*
    public $username = "sbirt";
    public $password = "ry94v8co";
    public $server = "127.0.0.1";
    public $databasename = "sbirt_dash";
*/

    public $username = "root";
    public $password = "asdf2423";
    public $server = "localhost";
    public $databasename = "sbirt_dash";

    
    public $port = "3306";
    var $tablename = "users";
    public $connection;

    public function __construct ()
    {

        $this->connection = mysqli_connect($this->server, $this->username,

        $this->password, $this->databasename, $this->port);

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
        	autoid, username, name, password, email, eulaSigned
           FROM $this->tablename WHERE username=? AND password=?");
        $this->throwExceptionOnError();
        
        $stmt->bind_param('ss', $username, $password);
        $this->throwExceptionOnError();
        
        $stmt->execute();
        $this->throwExceptionOnError();

        $obj = new UserVO();
        
        $stmt->bind_result($obj->autoid, $obj->username, $obj->name, $obj->password, $obj->email, $obj->eulaSigned);
        
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
    	$stmt = $this->connection->prepare("SELECT autoid, username, name, email, eulaSigned FROM $this->tablename");
    	$this->throwExceptionOnError();
    	
    	$stmt->execute();
    	$this->throwExceptionOnError();
    	
    	$users = array();
    	
    	$obj = new UserVO();
    	$stmt->bind_result($obj->autoid, $obj->username, $obj->name, $obj->email, $obj->eulaSigned);
    	
    	while ($stmt->fetch()) 
    	{
    		if($obj->initials != 'ZZ')
            	$users[] = $obj;
            $obj = new UserVO();
    		$stmt->bind_result($obj->autoid, $obj->username, $obj->name, $obj->email, $obj->eulaSigned);
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
        
        if($auth)
        {
        //Setting used to send mail to user
       	$config = array('auth' => 'login',
                'username' => 'david.tidd@angstrom-software.com',
                'password' => 'squirrelmob',
    	          'port'     => 465,
                'ssl' => 'ssl');

        $transport = new Zend_Mail_Transport_Smtp('mail.angstrom-software.com', $config);

    		$mail = new Zend_Mail();
		    $mail->setBodyText('Your password is '.$pw.'.');
		    $mail->setFrom('david.tidd@angstrom-software.com', 'SBIRT Dash System');
		    $mail->addTo($email, 'User');
		    $mail->setSubject('SBIRT Dash System: Password Recovery');
		    $mail->send($transport);
		    return true;
        }
        else return false;
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