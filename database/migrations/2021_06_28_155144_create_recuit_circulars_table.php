<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecuitCircularsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recuit_circulars', function (Blueprint $table) {
            $table->id();
            $table->string('jobTitle')->nullable();
            $table->string('publishDate')->nullable();
            $table->string('deadline')->nullable();
            $table->string('location')->nullable();
            $table->string('department')->nullable();
            $table->text('education')->nullable();
            $table->longText('details')->nullable();
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
        Schema::dropIfExists('recuit_circulars');
    }
}
