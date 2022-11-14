<?php

namespace common\models\query;

use Yii;
use yii\db\Expression;
use yii\helpers\ArrayHelper;
use yii\db\ActiveQuery;


/**
 * This is the ActiveQuery class for [[Locations]].
 *
 */
class LocationsQuery extends ActiveQuery
{
    /**
     * @param null $db
     * @return array|\yii\db\ActiveRecord[]
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @param null $db
     * @return array|null|\yii\db\ActiveRecord
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
