<?php

use yii\db\Migration;

class m130524_201442_init extends Migration
{
    public function up()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            // http://stackoverflow.com/questions/766809/whats-the-difference-between-utf8-general-ci-and-utf8-unicode-ci
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        // servers table
        $this->createTable('servers', [
            'server_id' => $this->primaryKey(),
            'server_model' => $this->string()->notNull(),
            'server_ram' => $this->integer()->notNull(),
            'server_hard_disk_type' => $this->string()->notNull(),
            'server_hard_disk_space' => $this->int(32)->notNull(),
            'server_price' => $this->double()->notNull(),
            'server_location_id' => $this->integer()->notNull(),
            'server_created_at' => $this->datetime()->notNull(),
            'server_updated_at' => $this->datetime()->notNull(),
        ], $tableOptions);

        // locations table
        $this->createTable('locations', [
            'location_id' => $this->primaryKey(),
            'location_name' => $this->string()->notNull(),
            'location_created_at' => $this->datetime()->notNull(),
            'location_updated_at' => $this->datetime()->notNull(),
        ], $tableOptions);

        // creates index for column `server_location_id`
        $this->createIndex(
            'idx-servers-server_location_id',
            'servers',
            'server_location_id'
        );
        // add foreign key for table `servers`
        $this->addForeignKey(
            'fk-servers-server_location_id',
            'servers',
            'server_location_id',
            'locations',
            'location_id',
            'CASCADE'
        );

    }

    public function down()
    {
        // drops foreign key for table `servers`
        $this->dropForeignKey(
            'fk-servers-server_location_id',
            'servers'
        );

        // drops index for column `server_location_id`
        $this->dropIndex(
            'idx-servers-server_location_id',
            'servers'
        );
        $this->dropTable('servers');
        $this->dropTable('locations');
    }
}
