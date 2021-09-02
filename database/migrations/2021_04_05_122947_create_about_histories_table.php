<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAboutHistoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('about_histories', function (Blueprint $table) {
            $table->id();
            $table->string('date', 100)->nullable();
            $table->string('title')->nullable();
            $table->text('details')->nullable();
            $table->string('image')->nullable();
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
        Schema::dropIfExists('about_histories');
    }
}
