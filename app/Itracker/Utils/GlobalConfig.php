<?php

namespace Itracker\Utils;

class GlobalConfig extends Config {

	/**
	 *
	 * @var GlobalConfig
	 */
	private static $__instance;

	/**
	 * 
	 * @return GlobalConfig
	 */
	public static function getInstance() {
		if ( !static::$__instance ) {
			static::$__instance = new static ('config.xml');
		}
		return self::$__instance;
	}

}

?>
