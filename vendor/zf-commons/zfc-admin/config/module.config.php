<?php
/**
 * Copyright (c) 2012 Jurian Sluiman.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *
 *   * Neither the names of the copyright holders nor the names of the
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * @package     ZfcAdmin
 * @subpackage  Controller
 * @author      Jurian Sluiman <jurian@soflomo.com>
 * @copyright   2012 Jurian Sluiman.
 * @license     http://www.opensource.org/licenses/bsd-license.php  BSD License
 * @link        http://zf-commons.github.com
 */

return array(
    'controllers' => array(
        'invokables' => array(
            'ZfcAdmin\Controller\AdminController' => 'ZfcAdmin\Controller\AdminController',
        ),
    ),
    'zfcadmin' => array(
        'use_admin_layout'      => true,
        'admin_layout_template' => 'layout/admin',
    ),

    'navigation' => array(
        'admin' => array(),
    ),

    'router' => array(
        'routes' => array(
            'zfcadmin' => array(
                'type' => 'literal',
                'options' => array(
                    'route'    => '/admin',
                    'defaults' => array(
                        'controller' => 'ZfcAdmin\Controller\AdminController',
                        'action'     => 'index',
                    ),
                ),
                'may_terminate' => true,
            ),
        ),
    ),

     'service_manager' => array(
        'factories' => array(
            'BjyAuthorize\Cache' => 'BjyAuthorize\Service\CacheFactory',
            'BjyAuthorize\Config' => 'BjyAuthorize\Service\ConfigServiceFactory',
            'BjyAuthorize\Guards' => 'BjyAuthorize\Service\GuardsServiceFactory',
            'BjyAuthorize\RoleProviders' => 'BjyAuthorize\Service\RoleProvidersServiceFactory',
            'BjyAuthorize\ResourceProviders' => 'BjyAuthorize\Service\ResourceProvidersServiceFactory',
            'BjyAuthorize\RuleProviders' => 'BjyAuthorize\Service\RuleProvidersServiceFactory',
            'BjyAuthorize\Guard\Controller' => 'BjyAuthorize\Service\ControllerGuardServiceFactory',
            'BjyAuthorize\Guard\Route' => 'BjyAuthorize\Service\RouteGuardServiceFactory',
            'BjyAuthorize\Provider\Role\Config' => 'BjyAuthorize\Service\ConfigRoleProviderServiceFactory',
            'BjyAuthorize\Provider\Role\ZendDb' => 'BjyAuthorize\Service\ZendDbRoleProviderServiceFactory',
            'BjyAuthorize\Provider\Rule\Config' => 'BjyAuthorize\Service\ConfigRuleProviderServiceFactory',
            'BjyAuthorize\Provider\Resource\Config' => 'BjyAuthorize\Service\ConfigResourceProviderServiceFactory',
            'BjyAuthorize\Service\Authorize' => 'BjyAuthorize\Service\AuthorizeFactory',
            'BjyAuthorize\Provider\Identity\ProviderInterface' => 'BjyAuthorize\Service\IdentityProviderServiceFactory',
            'BjyAuthorize\Provider\Identity\AuthenticationIdentityProvider' => 'BjyAuthorize\Service\AuthenticationIdentityProviderServiceFactory',
            'BjyAuthorize\Provider\Role\ObjectRepositoryProvider' => 'BjyAuthorize\Service\ObjectRepositoryRoleProviderFactory',
            'BjyAuthorize\Collector\RoleCollector' => 'BjyAuthorize\Service\RoleCollectorServiceFactory',
            'BjyAuthorize\Provider\Identity\ZfcUserZendDb' => 'BjyAuthorize\Service\ZfcUserZendDbIdentityProviderServiceFactory',
            'BjyAuthorize\View\UnauthorizedStrategy' => 'BjyAuthorize\Service\UnauthorizedStrategyServiceFactory',
        ),
        'invokables' => array(
            'BjyAuthorize\View\RedirectionStrategy' => 'BjyAuthorize\View\RedirectionStrategy',
        ),
        'aliases' => array(
            'bjyauthorize_zend_db_adapter' => 'Zend\Db\Adapter\Adapter',
        ),
        'initializers' => array(
            'BjyAuthorize\Service\AuthorizeAwareServiceInitializer' => 'BjyAuthorize\Service\AuthorizeAwareServiceInitializer'
        ),
    ),

    'view_manager' => array(
        'template_path_stack' => array(
            __DIR__ . '/../view'
        ),
    ),
);
