<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "locations".
 *
 * @property int $location_id
 * @property string $location_name
 * @property string $location_created_at
 * @property string $location_updated_at
 *
 * @property Servers[] $servers
 */
class Locations extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'locations';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['location_name'], 'required'],
            [['location_created_at', 'location_updated_at'], 'safe'],
            [['location_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'location_id' => 'Location ID',
            'location_name' => 'Location Name',
            'location_created_at' => 'Location Created At',
            'location_updated_at' => 'Location Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getServers()
    {
        return $this->hasMany(Servers::className(), ['server_location_id' => 'location_id']);
    }

    /**
     * @inheritdoc
     * @return query\ServersQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new query\ServersQuery(get_called_class());
    }
}
