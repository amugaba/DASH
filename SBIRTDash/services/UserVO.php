<?php
class UserVO
{
	public $autoid;
	/**
	 * @var string
	 */
	public $username;
	
	/**
	 * @var string
	 */
	public $name;
	
	/**
	 * @var string
	 */
	public $password;
	
	/**
	 * @var string
	 */
	public $email;
	public $eulaSigned;
	/**
	 * @var bool
	 */
	public $admin;
	/**
	 * @var int
	 */
	public $adminid;

	public function __construct()
	{
		$this->autoid = 0;
		$this->username = "";
		$this->name = "";
		$this->password = "";
		$this->email = "";
		$this->admin = FALSE;
		$this->eulaSigned = 0;
		$this->adminid = 0;
	}
}
?>