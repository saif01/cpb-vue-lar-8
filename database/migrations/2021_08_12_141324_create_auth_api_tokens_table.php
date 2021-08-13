<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAuthApiTokensTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('auth_api_tokens', function (Blueprint $table) {
            $table->id();
            $table->integer('token_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->string('raw_token')->nullable();
            $table->string('saved_token')->nullable();
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
        Schema::dropIfExists('auth_api_tokens');
    }
}
