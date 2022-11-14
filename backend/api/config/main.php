<?php

$params = array_merge(
        require(__DIR__ . '/../../common/config/params.php'),
        require(__DIR__ . '/../../common/config/params-local.php'),
        require(__DIR__ . '/params.php'),
        require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'api',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'api\controllers',
    'bootstrap' => ['log'],
    'modules' => [
        'v1' => [
            'basePath' => '@api/modules/v1',
            'class' => 'api\modules\v1\Module',
        ],
    ],
    'components' => [
        'request' => [
            'enableCookieValidation' => false,
            // Accept and parse JSON Requests
            'parsers' => [
                'application/json' => 'yii\web\JsonParser',
            ]
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing' => false,
            'showScriptName' => false,
            'rules' => [
                [ // QueryController
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'v1/query',
                    'pluralize' => false,
                    'patterns' => [
                        'GET' => 'list',
                        'POST' => 'create',
                        'GET list-solution/<query_uuid>' => 'list-solutions',
                        'POST solution/<query_uuid>' => 'submit-solution',
                        'GET <query_uuid>' => 'view',
                        // OPTIONS VERBS
                        'OPTIONS' => 'options',
                        'OPTIONS <query_uuid>' => 'options',
                        'OPTIONS solution/<query_uuid>' => 'options',
                        'OPTIONS list-solution/<query_uuid>' => 'options'
                    ]
                ],
                [
                    // LocationController
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'v1/location',
                    'patterns' => [
                        'GET' => 'list',
                        // OPTIONS VERBS
                        'OPTIONS' => 'options',

                    ]
                ],
            ],
        ],
    ],
    'params' => $params,
];
