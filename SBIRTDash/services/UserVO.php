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

	public function __construct()
	{
		$this->autoid = 0;
		$this->username = "";
		$this->name = "";
		$this->password = "";
		$this->email = "";
		$this->eulaSigned = 0;
	}
}
?>