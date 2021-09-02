<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCircularInfosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('circular_infos', function (Blueprint $table) {
            $table->id();
            $table->string('job_title')->nullable();
            $table->string('publish_date')->nullable();
            $table->string('deadline')->nullable();
            $table->string('location')->nullable();
            $table->string('department')->nullable();
            $table->text('education')->nullable();
            $table->longText('description')->nullable();
            $table->text('requirement')->nullable();
            $table->text('experience')->nullable();
            $table->string('salary')->nullable();
            $table->string('status', 20)->nullable();
            $table->string('created_by', 20)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('circular_infos');
    }
}
