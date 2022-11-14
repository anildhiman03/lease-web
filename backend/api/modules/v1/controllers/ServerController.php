<?php

namespace api\modules\v1\controllers;

use api\models\Servers;
use Yii;
use yii\rest\Controller;
use yii\data\ActiveDataProvider;

/**
 * Server controller
 */
class ServerController extends Controller {

    public function behaviors() {
        $behaviors = parent::behaviors();

        // remove authentication filter for cors to work
        unset($behaviors['authenticator']);

        // Allow XHR Requests from our different subdomains and dev machines
        $behaviors['corsFilter'] = [
            'class' => \yii\filters\Cors::className(),
            'cors' => [
                'Origin' => Yii::$app->params['allowedOrigins'],
                'Access-Control-Request-Method' => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD', 'OPTIONS'],
                'Access-Control-Request-Headers' => ['*'],
                'Access-Control-Allow-Credentials' => null,
                'Access-Control-Max-Age' => 86400,
                'Access-Control-Expose-Headers' => [
                    'X-Pagination-Current-Page',
                    'X-Pagination-Page-Count',
                    'X-Pagination-Per-Page',
                    'X-Pagination-Total-Count'
                ],
            ],
        ];

        // Bearer Auth checks for Authorize: Bearer <Token> header to login the user
        $behaviors['authenticator'] = [
            'class' => \yii\filters\auth\HttpBearerAuth::className(),
        ];

        $behaviors['authenticator']['except'] = [
            'options',
            'list',
        ];

        return $behaviors;
    }

    /**
     * @inheritdoc
     */
    public function actions() {
        $actions = parent::actions();
        $actions['options'] = [
            'class' => 'yii\rest\OptionsAction',
            'collectionOptions' => ['GET', 'POST', 'HEAD', 'OPTIONS'],
            'resourceOptions' => ['GET', 'PUT', 'PATCH', 'DELETE', 'HEAD', 'OPTIONS'],
        ];
        return $actions;
    }

    /**
     * List Server
     * @return ActiveDataProvider
     */
    public function actionList()
    {

        $query = Servers::find();
        if ($model = Yii::$app->request->get('model', null)) {
            $query->filterByName($model);
        }

        if ($location = Yii::$app->request->get('location', null)) {
            $query->filterByLocation($location);
        }

        if ($type = Yii::$app->request->get('type', null)) {
            $query->filterByHardDiskType($type);
        }

        if ($storage = Yii::$app->request->get('storage', null)) {
            $query->filterByHardStorage($storage);
        }

        if ($ram = Yii::$app->request->get('ram', null)) {
            $query->filterByRam($ram);
        }

        $query->select("server_model,server_ram,server_hard_disk_type,server_hard_disk_space,server_price,server_location_id");
        return new ActiveDataProvider([
            'query' => $query
        ]);
    }
}
