<?php

/**
 * BjyAuthorize Module (https://github.com/bjyoungblood/BjyAuthorize)
 *
 * @link https://github.com/bjyoungblood/BjyAuthorize for the canonical source repository
 * @license http://framework.zend.com/license/new-bsd New BSD License
 */
return array(
    'bjyauthorize' => array(
        'guards' => array(
            'BjyAuthorize\Guard\Route' => array(
                array('route' => 'zfcuser', 'roles' => array('user')),
                array('route' => 'zfcuser/logout', 'roles' => array('user')),
                array('route' => 'zfcuser/login', 'roles' => array('guest')),
                array('route' => 'zfcuser/register', 'roles' => array('guest')),
                array('route' => 'scn-social-auth-user', 'roles' => array('user')),
                array('route' => 'scn-social-auth-user/logout', 'roles' => array('user')),
                array('route' => 'scn-social-auth-user/login', 'roles' => array('guest')),
                array('route' => 'scn-social-auth-user/register', 'roles' => array('guest')),
                // Below is the default index action used by the ZendSkeletonApplication
                array('route' => 'home', 'roles' => array('guest', 'user')),
                array('route' => 'index', 'roles' => array('guest', 'user')),
            ),
        ),
    ),
);
