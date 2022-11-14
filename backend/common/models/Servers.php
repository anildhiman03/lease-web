<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "servers".
 *
 * @property int $server_id
 * @property string $server_model
 * @property int $server_ram
 * @property string $server_hard_disk_type
 * @property int $server_hard_disk_space
 * @property double $server_price
 * @property int $server_location_id
 * @property string $server_created_at
 * @property string $server_updated_at
 *
 * @property Locations $serverLocation
 */
class Servers extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'servers';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['server_model', 'server_ram', 'server_price', 'server_location_id'], 'required'],
            [['server_ram', 'server_hard_disk_space', 'server_location_id'], 'integer'],
            [['server_hard_disk_type'], 'string'],
            [['server_price'], 'number'],
            [['server_created_at', 'server_updated_at'], 'safe'],
            [['server_model'], 'string', 'max' => 255],
            [['server_location_id'], 'exist', 'skipOnError' => true, 'targetClass' => Locations::className(), 'targetAttribute' => ['server_location_id' => 'location_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'server_id' => 'Server ID',
            'server_model' => 'Server Model',
            'server_ram' => 'Server Ram',
            'server_hard_disk_type' => 'Server Hard Disk Type',
            'server_hard_disk_space' => 'Server Hard Disk Space',
            'server_price' => 'Server Price',
            'server_location_id' => 'Server Location ID',
            'server_created_at' => 'Server Created At',
            'server_updated_at' => 'Server Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getServerLocation()
    {
        return $this->hasOne(Locations::className(), ['location_id' => 'server_location_id']);
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
