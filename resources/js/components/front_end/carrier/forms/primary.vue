<template>
    <div>
        <main id="main">

            <section class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>Primary Form</h2>
                        <ol>
                            <li>
                                <router-link :to="{name:'index'}">Home</router-link>
                            </li>
                            <li>
                                <router-link :to="{name:'carrier_index'}">Carrier</router-link>
                            </li>
                            <li>Primary Application Form</li>
                        </ol>
                    </div>

                </div>
            </section>


            <section class="contact">
                <div class="container">


                    <div class="accordion" role="tablist">
                        <b-card no-body class="mb-1">
                            <b-card-header header-tag="header" class="p-1" role="tab">
                                <b-button block v-b-toggle.accordion-1 variant="info">Application and Personal Info
                                </b-button>
                            </b-card-header>
                            <b-collapse id="accordion-1" accordion="my-accordion" role="tabpanel">
                                <b-card-body>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <b-form-group label="Publish Date:">
                                                <b-form-datepicker v-model="form.date_application" today-button
                                                    reset-button close-button locale="en" placeholder="YYYY-MM-DD"
                                                    autocomplete="off" size="sm" :hide-header="datePickerHeader"
                                                    :date-format-options="{ year: 'numeric', month: 'long', day: 'numeric' }"
                                                    :class="{ 'is-invalid': form.errors.has('date_application') }">
                                                </b-form-datepicker>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('date_application')"
                                                    v-html="form.errors.get('date_application')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-4">
                                            <b-form-group label="Desired Salary:">
                                                <b-form-input v-model="form.desired_salary"
                                                    placeholder="Enter desired salary in tk" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('desired_salary') }">
                                                </b-form-input>
                                                <div class="small text-danger" v-if="form.errors.has('desired_salary')"
                                                    v-html="form.errors.get('desired_salary')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-4">
                                            <b-form-group label="Desired Position:">
                                                <b-form-input v-model="form.desired_position"
                                                    placeholder="Enter desired position name" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('desired_position') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('desired_position')"
                                                    v-html="form.errors.get('desired_position')" />
                                            </b-form-group>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-md-4">
                                            <b-form-group label="Like to work in area:">
                                                <b-form-input v-model="form.work_in_area"
                                                    placeholder="Enter like to work in area" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('work_in_area') }">
                                                </b-form-input>
                                                <div class="small text-danger" v-if="form.errors.has('work_in_area')"
                                                    v-html="form.errors.get('work_in_area')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-8">
                                            <b-form-group label="When you can start working with us, if employed:">
                                                <b-form-input v-model="form.possible_start_working"
                                                    placeholder="Enter possible start working" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('possible_start_working') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('possible_start_working')"
                                                    v-html="form.errors.get('possible_start_working')" />
                                            </b-form-group>
                                        </div>


                                    </div>

                                    <p class="text-center text-muted">---- Personal Information ---</p>

                                    <div class="row">

                                        <div class="col-md-4">
                                            <b-form-group label="Title: Mr. /Miss / Mrs. :">
                                                <b-form-input v-model="form.applicant_name"
                                                    placeholder="Enter like to work in area" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('applicant_name') }">
                                                </b-form-input>
                                                <div class="small text-danger" v-if="form.errors.has('applicant_name')"
                                                    v-html="form.errors.get('applicant_name')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-4">
                                            <b-form-group label="Nationality :">
                                                <b-form-input v-model="form.applicant_nationality"
                                                    placeholder="Enter possible start working" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('applicant_nationality') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('applicant_nationality')"
                                                    v-html="form.errors.get('applicant_nationality')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-4">
                                            <b-form-group label="National ID: ">
                                                <b-form-input v-model="form.applicant_nid"
                                                    placeholder="Enter possible national ID " size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('applicant_nid') }">
                                                </b-form-input>
                                                <div class="small text-danger" v-if="form.errors.has('applicant_nid')"
                                                    v-html="form.errors.get('applicant_nid')" />
                                            </b-form-group>
                                        </div>


                                    </div>

                                    <div class="row">

                                        <div class="col-md-4">
                                            <b-form-group label="Date of Birth :">
                                                <b-form-datepicker v-model="form.applicant_dob" today-button
                                                    reset-button close-button locale="en" placeholder="YYYY-MM-DD"
                                                    autocomplete="off" size="sm" :hide-header="datePickerHeader"
                                                    :date-format-options="{ year: 'numeric', month: 'long', day: 'numeric' }"
                                                    :class="{ 'is-invalid': form.errors.has('applicant_dob') }">
                                                </b-form-datepicker>
                                                <div class="small text-danger" v-if="form.errors.has('applicant_dob')"
                                                    v-html="form.errors.get('applicant_dob')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-2">
                                            <b-form-group label="Your Current Age :">
                                                <b-form-input v-model="form.applicant_age" placeholder="Enter your age"
                                                    size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('applicant_age') }">
                                                </b-form-input>
                                                <div class="small text-danger" v-if="form.errors.has('applicant_age')"
                                                    v-html="form.errors.get('applicant_age')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-2">
                                            <b-form-group label="Your Height: ">
                                                <b-form-input v-model="form.applicant_height"
                                                    placeholder="Enter your height" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('applicant_height') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('applicant_height')"
                                                    v-html="form.errors.get('applicant_height')" />
                                            </b-form-group>
                                        </div>

                                        <div class="col-md-2">
                                            <b-form-group label="Your Weight: ">
                                                <b-form-input v-model="form.applicant_weight"
                                                    placeholder="Enter your weight" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('applicant_weight') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('applicant_weight')"
                                                    v-html="form.errors.get('applicant_weight')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-2">
                                            <b-form-group label="Your Religion: ">
                                                <b-form-input v-model="form.applicant_religion"
                                                    placeholder="Enter your religion" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('applicant_religion') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('applicant_religion')"
                                                    v-html="form.errors.get('applicant_religion')" />
                                            </b-form-group>
                                        </div>


                                    </div>

                                    <div class="row">

                                        <div class="col-md-6">
                                            <b-form-group label="Present Address :">
                                                <b-form-textarea v-model="form.applicant_present_address"
                                                    placeholder="Enter your present address" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('applicant_present_address') }">
                                                </b-form-textarea>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('applicant_present_address')"
                                                    v-html="form.errors.get('applicant_present_address')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-6">
                                            <b-form-group label="Permanent Address :">
                                                <b-form-textarea v-model="form.applicant_permanent_address"
                                                    placeholder="Enter permanent address" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('applicant_permanent_address') }">
                                                </b-form-textarea>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('applicant_permanent_address')"
                                                    v-html="form.errors.get('applicant_permanent_address')" />
                                            </b-form-group>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-md-4">
                                            <b-form-group label="Your contact number:">
                                                <b-form-input v-model="form.applicant_contact"
                                                    placeholder="Enter your contact number" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('applicant_contact') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('applicant_contact')"
                                                    v-html="form.errors.get('applicant_contact')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-4">
                                            <b-form-group label="Your Email Address :">
                                                <b-form-input type="email" v-model="form.applicant_email"
                                                    placeholder="Enter your email address" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('applicant_email') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('applicant_email')"
                                                    v-html="form.errors.get('applicant_email')" />
                                            </b-form-group>
                                        </div>

                                        <div class="col-md-4">

                                            <b-form-group label="Marital Status :">
                                                <b-form-select v-model="form.applicant_marital_status" :options="applicant_marital_status_option" size="sm" :class="{ 'is-invalid': form.errors.has('applicant_marital_status') }"></b-form-select>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('applicant_marital_status')"
                                                    v-html="form.errors.get('applicant_marital_status')" />
                                            </b-form-group>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-md-3">
                                            <b-form-group label="Your Father Name :">
                                                <b-form-input v-model="form.father_name"
                                                    placeholder="Enter your father name" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('father_name') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('father_name')"
                                                    v-html="form.errors.get('father_name')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Father Occupation :">
                                                <b-form-input v-model="form.father_occupation"
                                                    placeholder="Enter father occupation" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('father_occupation') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('father_occupation')"
                                                    v-html="form.errors.get('father_occupation')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Father Address :">
                                                <b-form-input v-model="form.father_address"
                                                    placeholder="Enter father address" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('father_address') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('father_address')"
                                                    v-html="form.errors.get('father_address')" />
                                            </b-form-group>
                                        </div>
                                       <div class="col-md-3">
                                            <b-form-group label="Father Phone Number :">
                                                <b-form-input v-model="form.father_phone"
                                                    placeholder="Enter father phone number" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('father_phone') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('father_phone')"
                                                    v-html="form.errors.get('father_phone')" />
                                            </b-form-group>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-md-3">
                                            <b-form-group label="Your Mother Name :">
                                                <b-form-input v-model="form.mother_name"
                                                    placeholder="Enter your mother name" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('mother_name') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('mother_name')"
                                                    v-html="form.errors.get('mother_name')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Mother Occupation :">
                                                <b-form-input v-model="form.mother_occupation"
                                                    placeholder="Enter mother occupation" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('mother_occupation') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('mother_occupation')"
                                                    v-html="form.errors.get('mother_occupation')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Mother Address :">
                                                <b-form-input v-model="form.mother_address"
                                                    placeholder="Enter mother address" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('mother_address') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('mother_address')"
                                                    v-html="form.errors.get('mother_address')" />
                                            </b-form-group>
                                        </div>
                                       <div class="col-md-3">
                                            <b-form-group label="Mother Phone Number :">
                                                <b-form-input v-model="form.mother_phone"
                                                    placeholder="Enter mother phone number" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('mother_phone') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('mother_phone')"
                                                    v-html="form.errors.get('mother_phone')" />
                                            </b-form-group>
                                        </div>

                                    </div>

                                     <div class="row">

                                        <div class="col-md-3">
                                            <b-form-group label="Your Spouse Name :">
                                                <b-form-input v-model="form.spouse_name"
                                                    placeholder="Enter your spouse name" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('spouse_name') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('spouse_name')"
                                                    v-html="form.errors.get('spouse_name')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Spouse Occupation :">
                                                <b-form-input v-model="form.spouse_occupation"
                                                    placeholder="Enter spouse occupation" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('spouse_occupation') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('spouse_occupation')"
                                                    v-html="form.errors.get('spouse_occupation')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Spouse Address :">
                                                <b-form-input v-model="form.spouse_address"
                                                    placeholder="Enter spouse address" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('spouse_address') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('spouse_address')"
                                                    v-html="form.errors.get('spouse_address')" />
                                            </b-form-group>
                                        </div>
                                       <div class="col-md-3">
                                            <b-form-group label="Spouse Phone Number :">
                                                <b-form-input v-model="form.spouse_phone"
                                                    placeholder="Enter spouse phone number" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('spouse_phone') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('spouse_phone')"
                                                    v-html="form.errors.get('spouse_phone')" />
                                            </b-form-group>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-md-4">
                                            <b-form-group label="Your Total Number of Sister Brother :">
                                                <b-form-input type="number" v-model="form.number_sister_brother"
                                                    placeholder="Enter your total number sister-brother" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('number_sister_brother') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('number_sister_brother')"
                                                    v-html="form.errors.get('number_sister_brother')" />
                                            </b-form-group>
                                        </div>
                                       <div class="col-md-4">
                                            <b-form-group label="Your Total Number of Sister:">
                                                <b-form-input type="number" v-model="form.number_sister"
                                                    placeholder="Enter your total number sister" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('number_sister') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('number_sister')"
                                                    v-html="form.errors.get('number_sister')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-4">
                                            <b-form-group label="Your Total Number of Brother :">
                                                <b-form-input type="number" v-model="form.number_brother"
                                                    placeholder="Enter your total number brother" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('number_brother') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('number_brother')"
                                                    v-html="form.errors.get('number_brother')" />
                                            </b-form-group>
                                        </div>

                                    </div>



                                    <b-form-group v-if="form.progress">
                                        <b-progress :value="form.progress.percentage" variant="success" striped
                                            animated>
                                        </b-progress>
                                    </b-form-group>


                                    <b-form-group v-if="!form.progress">
                                        <b-button type="submit" class="btn-block" variant="success">Update</b-button>
                                    </b-form-group>

                                </b-card-body>
                            </b-collapse>
                        </b-card>

                        <b-card no-body class="mb-1">
                            <b-card-header header-tag="header" class="p-1" role="tab">
                                <b-button block v-b-toggle.accordion-2 variant="info">Education Background</b-button>
                            </b-card-header>
                            <b-collapse id="accordion-2"  accordion="my-accordion" role="tabpanel">
                                <b-card-body>
                                    <p class="text-center text-muted">Secondary School Certificate (SSC)</p>
                                    <div class="row">

                                        <div class="col-md-3">
                                            <b-form-group label="SSC Institution Name :">
                                                <b-form-input v-model="form.ssc_institution"
                                                    placeholder="Enter ssc institution name" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('ssc_institution') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('ssc_institution')"
                                                    v-html="form.errors.get('ssc_institution')" />
                                            </b-form-group>
                                        </div>
                                       <div class="col-md-3">
                                            <b-form-group label="SSC Major / Field / Area:">
                                                <b-form-input v-model="form.ssc_field"
                                                    placeholder="Enter your ssc major" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('ssc_field') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('ssc_field')"
                                                    v-html="form.errors.get('ssc_field')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Your SSC Passing Year :">
                                                <b-form-input v-model="form.ssc_passing_year"
                                                    placeholder="Enter your ssc passing year" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('ssc_passing_year') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('ssc_passing_year')"
                                                    v-html="form.errors.get('ssc_passing_year')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Your SSC Grade :">
                                                <b-form-input v-model="form.ssc_grade"
                                                    placeholder="Enter your ssc grade" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('ssc_grade') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('ssc_grade')"
                                                    v-html="form.errors.get('ssc_grade')" />
                                            </b-form-group>
                                        </div>

                                    </div>
                                    <p class="text-center text-muted">Higher School Certificate (HSC)</p>
                                    <div class="row">

                                        <div class="col-md-3">
                                            <b-form-group label="HSC Institution Name :">
                                                <b-form-input v-model="form.hsc_institution"
                                                    placeholder="Enter hsc institution name" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('hsc_institution') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('hsc_institution')"
                                                    v-html="form.errors.get('hsc_institution')" />
                                            </b-form-group>
                                        </div>
                                       <div class="col-md-3">
                                            <b-form-group label="HSC Major / Field / Area:">
                                                <b-form-input v-model="form.hsc_field"
                                                    placeholder="Enter your hsc major" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('hsc_field') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('hsc_field')"
                                                    v-html="form.errors.get('hsc_field')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Your HSC Passing Year :">
                                                <b-form-input v-model="form.hsc_passing_year"
                                                    placeholder="Enter your hsc passing year" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('hsc_passing_year') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('hsc_passing_year')"
                                                    v-html="form.errors.get('hsc_passing_year')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Your HSC Grade :">
                                                <b-form-input v-model="form.hsc_grade"
                                                    placeholder="Enter your ssc grade" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('hsc_grade') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('hsc_grade')"
                                                    v-html="form.errors.get('hsc_grade')" />
                                            </b-form-group>
                                        </div>

                                    </div>

                                    <p class="text-center text-muted">Diploma / Graduation</p>
                                    <div class="row">

                                        <div class="col-md-3">
                                            <b-form-group label="Dip./Grad. Institution Name :">
                                                <b-form-input v-model="form.dip_grad_institution"
                                                    placeholder="Enter diploma/graduation institution name" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('dip_grad_institution') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('dip_grad_institution')"
                                                    v-html="form.errors.get('dip_grad_institution')" />
                                            </b-form-group>
                                        </div>
                                       <div class="col-md-3">
                                            <b-form-group label="Dip./Grad. Major :">
                                                <b-form-input v-model="form.dip_grad_field"
                                                    placeholder="Enter diploma/graduation your major" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('dip_grad_field') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('dip_grad_field')"
                                                    v-html="form.errors.get('dip_grad_field')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Dip./Grad. Passing Year :">
                                                <b-form-input v-model="form.dip_grad_passing_year"
                                                    placeholder="Enter diploma/graduation passing year" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('dip_grad_passing_year') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('dip_grad_passing_year')"
                                                    v-html="form.errors.get('dip_grad_passing_year')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Dip./Grad. Grade :">
                                                <b-form-input v-model="form.dip_grad_grade"
                                                    placeholder="Enter diploma/graduation grade" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('dip_grad_grade') }">
                                                </b-form-input>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('dip_grad_grade')"
                                                    v-html="form.errors.get('dip_grad_grade')" />
                                            </b-form-group>
                                        </div>

                                    </div>

                                    <div class="border border-warning p-2 mb-2">

                                        <p class="text-center text-muted">Post Graduation ( If applicable )</p>
                                        <div class="row">

                                            <div class="col-md-3">
                                                <b-form-group label="Post Grad. Institution Name :">
                                                    <b-form-input v-model="form.post_grad_institution"
                                                        placeholder="Enter post graduation institution name" size="sm"
                                                        :class="{ 'is-invalid': form.errors.has('post_grad_institution') }">
                                                    </b-form-input>
                                                    <div class="small text-danger"
                                                        v-if="form.errors.has('post_grad_institution')"
                                                        v-html="form.errors.get('post_grad_institution')" />
                                                </b-form-group>
                                            </div>
                                        <div class="col-md-3">
                                                <b-form-group label="Post Grad. Major :">
                                                    <b-form-input v-model="form.post_grad_field"
                                                        placeholder="Enter post graduation your major" size="sm"
                                                        :class="{ 'is-invalid': form.errors.has('post_grad_field') }">
                                                    </b-form-input>
                                                    <div class="small text-danger"
                                                        v-if="form.errors.has('post_grad_field')"
                                                        v-html="form.errors.get('post_grad_field')" />
                                                </b-form-group>
                                            </div>
                                            <div class="col-md-3">
                                                <b-form-group label="Post Grad. Passing Year :">
                                                    <b-form-input v-model="form.post_grad_passing_year"
                                                        placeholder="Enter post graduation passing year" size="sm"
                                                        :class="{ 'is-invalid': form.errors.has('post_grad_passing_year') }">
                                                    </b-form-input>
                                                    <div class="small text-danger"
                                                        v-if="form.errors.has('post_grad_passing_year')"
                                                        v-html="form.errors.get('post_grad_passing_year')" />
                                                </b-form-group>
                                            </div>
                                            <div class="col-md-3">
                                                <b-form-group label="Post Grad. Grade :">
                                                    <b-form-input v-model="form.post_grad_grade"
                                                        placeholder="Enter post graduation grade" size="sm"
                                                        :class="{ 'is-invalid': form.errors.has('post_grad_grade') }">
                                                    </b-form-input>
                                                    <div class="small text-danger"
                                                        v-if="form.errors.has('post_grad_grade')"
                                                        v-html="form.errors.get('post_grad_grade')" />
                                                </b-form-group>
                                            </div>

                                        </div>

                                        <p class="text-center text-muted">Others ( If applicable )</p>
                                        <div class="row">

                                            <div class="col-md-3">
                                                <b-form-group label="Institution Name :">
                                                    <b-form-input v-model="form.others_institution"
                                                        placeholder="Enter institution name" size="sm"
                                                        :class="{ 'is-invalid': form.errors.has('others_institution') }">
                                                    </b-form-input>
                                                    <div class="small text-danger"
                                                        v-if="form.errors.has('others_institution')"
                                                        v-html="form.errors.get('others_institution')" />
                                                </b-form-group>
                                            </div>
                                        <div class="col-md-3">
                                                <b-form-group label="Major :">
                                                    <b-form-input v-model="form.others_field"
                                                        placeholder="Enter your major" size="sm"
                                                        :class="{ 'is-invalid': form.errors.has('others_field') }">
                                                    </b-form-input>
                                                    <div class="small text-danger"
                                                        v-if="form.errors.has('others_field')"
                                                        v-html="form.errors.get('others_field')" />
                                                </b-form-group>
                                            </div>
                                            <div class="col-md-3">
                                                <b-form-group label="Passing Year :">
                                                    <b-form-input v-model="form.others_passing_year"
                                                        placeholder="Enter passing year" size="sm"
                                                        :class="{ 'is-invalid': form.errors.has('others_passing_year') }">
                                                    </b-form-input>
                                                    <div class="small text-danger"
                                                        v-if="form.errors.has('others_passing_year')"
                                                        v-html="form.errors.get('others_passing_year')" />
                                                </b-form-group>
                                            </div>
                                            <div class="col-md-3">
                                                <b-form-group label="Grade :">
                                                    <b-form-input v-model="form.others_grade"
                                                        placeholder="Enter grade" size="sm"
                                                        :class="{ 'is-invalid': form.errors.has('others_grade') }">
                                                    </b-form-input>
                                                    <div class="small text-danger"
                                                        v-if="form.errors.has('others_grade')"
                                                        v-html="form.errors.get('others_grade')" />
                                                </b-form-group>
                                            </div>

                                        </div>

                                    </div>


                                    <b-form-group v-if="form.progress">
                                        <b-progress :value="form.progress.percentage" variant="success" striped
                                            animated>
                                        </b-progress>
                                    </b-form-group>


                                    <b-form-group v-if="!form.progress">
                                        <b-button type="submit" class="btn-block" variant="success">Update</b-button>
                                    </b-form-group>
                                </b-card-body>
                            </b-collapse>
                        </b-card>

                        <b-card no-body class="mb-1">
                            <b-card-header header-tag="header" class="p-1" role="tab">
                                <b-button block v-b-toggle.accordion-3 variant="info">Employment History</b-button>
                            </b-card-header>
                            <b-collapse id="accordion-3" visible accordion="my-accordion" role="tabpanel">
                                <b-card-body>

                                    <p class="text-center text-muted">---- Experience or Employment Information ---</p>

                                    <div class="row">
                                        <div class="col-md-3">
                                            <b-form-group label="Name of the Company:">
                                                <b-form-input v-model="form.company_name"
                                                    placeholder="Enter name of the company" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('company_name') }">
                                                </b-form-input>
                                                <div class="small text-danger" v-if="form.errors.has('company_name')"
                                                    v-html="form.errors.get('company_name')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Position / Designation:">
                                                <b-form-input v-model="form.designation"
                                                    placeholder="Enter designation" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('designation') }">
                                                </b-form-input>
                                                <div class="small text-danger" v-if="form.errors.has('designation')"
                                                    v-html="form.errors.get('designation')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Starting Date:">
                                                <b-form-datepicker v-model="form.starting_date" today-button
                                                    reset-button close-button locale="en" placeholder="YYYY-MM-DD"
                                                    autocomplete="off" size="sm" :hide-header="datePickerHeader"
                                                    :date-format-options="{ year: 'numeric', month: 'long', day: 'numeric' }"
                                                    :class="{ 'is-invalid': form.errors.has('starting_date') }">
                                                </b-form-datepicker>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('starting_date')"
                                                    v-html="form.errors.get('starting_date')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-3">
                                            <b-form-group label="Leaving Date:">
                                                <b-form-datepicker v-model="form.leaving_date" today-button
                                                    reset-button close-button locale="en" placeholder="YYYY-MM-DD"
                                                    autocomplete="off" size="sm" :hide-header="datePickerHeader"
                                                    :date-format-options="{ year: 'numeric', month: 'long', day: 'numeric' }"
                                                    :class="{ 'is-invalid': form.errors.has('leaving_date') }">
                                                </b-form-datepicker>
                                                <div class="small text-danger"
                                                    v-if="form.errors.has('leaving_date')"
                                                    v-html="form.errors.get('leaving_date')" />
                                            </b-form-group>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">
                                            <b-form-group label="Salary :">
                                                <b-form-input v-model="form.salary"
                                                    placeholder="Enter salary " size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('salary') }">
                                                </b-form-input>
                                                <div class="small text-danger" v-if="form.errors.has('salary')"
                                                    v-html="form.errors.get('salary')" />
                                            </b-form-group>
                                        </div>
                                        <div class="col-md-9">
                                            <b-form-group label="Leaving Reason:">
                                                <b-form-input v-model="form.leaving_reason"
                                                    placeholder="Enter leaving reason" size="sm"
                                                    :class="{ 'is-invalid': form.errors.has('leaving_reason') }">
                                                </b-form-input>
                                                <div class="small text-danger" v-if="form.errors.has('leaving_reason')"
                                                    v-html="form.errors.get('leaving_reason')" />
                                            </b-form-group>
                                        </div>
                                       

                                    </div>







                                </b-card-body>
                            </b-collapse>
                        </b-card>
                    </div>




                </div>

            </section>


        </main><!-- End #main -->
    </div>
</template>


<script>
    import From from 'vform';
    // in full builds helpers are exposed as Vuex.mapState
    import {
        mapGetters
    } from 'vuex'

    export default {
        name: 'carrier',
        data() {
            return {

                text: 'This is test',
                datePickerHeader:true,

                applicant_marital_status_option:[
                    { value: '', text: 'Please select an option' },
                    { value: 'single', text: 'Single' },
                    { value: 'married', text: 'Married'},
                    { value: 'divorced', text: 'Divorced'},
                    { value: 'widowed', text: 'Widowed'},
                    { value: 'others', text: 'Others'},
                ],

                form: new From({
                    date_application: '',
                    desired_salary: '',
                    desired_position: '',
                    work_in_area: '',
                    possible_start_working: '',
                    applicant_name: '',
                    applicant_nationality: '',
                    applicant_nid: '',
                    applicant_dob: '',
                    applicant_age: '',
                    applicant_height: '',
                    applicant_weight: '',
                    applicant_religion: '',
                    applicant_present_address: '',
                    applicant_permanent_address: '',
                    applicant_contact: '',
                    applicant_email: '',
                    applicant_marital_status: '',
                    father_name: '',
                    father_occupation: '',
                    father_address: '',
                    father_phone: '',
                    mother_name: '',
                    mother_occupation: '',
                    mother_address: '',
                    mother_phone: '',
                    spouse_name: '',
                    spouse_occupation: '',
                    spouse_address: '',
                    spouse_phone: '',
                    number_sister_brother: '',
                    number_sister: '',
                    number_brother: '',

                    ssc_institution: '',
                    ssc_field: '',
                    ssc_passing_year: '',
                    ssc_grade: '',
                    hsc_institution: '',
                    hsc_field: '',
                    hsc_passing_year: '',
                    hsc_grade: '',
                    dip_grad_institution: '',
                    dip_grad_field: '',
                    dip_grad_passing_year: '',
                    dip_grad_grade: '',
                    post_grad_institution: '',
                    post_grad_field: '',
                    post_grad_passing_year: '',
                    post_grad_grade: '',
                    others_institution: '',
                    others_field: '',
                    others_passing_year: '',
                    others_grade: '',

                    company_name: '',
                    designation: '',
                    starting_date: '',
                    leaving_date: '',
                    salary: '',
                    leaving_reason:'', 




                }),

            }
        },

        methods: {

            // Check Applied or not
            checkApplied(item) {
                //console.log(item.user_apply)
                if (this.user && item.user_apply) {
                    if (item.user_apply.recuit_circular_id == item.id && item.user_apply.user_id == this.user.id) {
                        return true;
                    }
                }
                return false;
            },



            async applyForJob(id) {

                if (!this.user) {
                    Swal.fire("Failed!", "Please Login to apply", "warning");
                    // Auth redirect to login
                    this.$router.push({
                        name: 'carrier_login'
                    })

                } else {
                    // After Login 
                    try {

                        const response = await axios.post('/api/carrier_job_apply', {
                            carrierId: id,
                            user: this.user
                        });
                        console.log(response);

                        if (response.status == 200) {

                            // Update data by store
                            this.$store.dispatch('recruitData');

                            Toast.fire({
                                icon: response.data.icon,
                                title: response.data.msg
                            });
                        } else if (response.status == 203) {


                            // Redirect to dashboard
                            this.$router.push({
                                name: 'carrier_login'
                            });

                            Toast.fire({
                                icon: response.data.icon,
                                title: response.data.msg
                            });


                        } else {
                            Swal.fire("Failed!", data.message, "warning");
                            console.log(response);
                        }

                    } catch (error) {
                        console.error(error);
                    }

                }

            },


            // Send CV 
            async sendMsg() {
                console.log('Form submited');
                this.$Progress.start()
                // request send and get response
                const response = await this.form.post('/api/carrier_msg');
                // Input field make empty
                this.form.reset();
                this.form.errors.clear();

                this.$Progress.finish();

                if (response.status == 200) {
                    Toast.fire({
                        icon: response.data.icon,
                        title: response.data.msg
                    });
                } else {
                    Swal.fire("Failed!", data.message, "warning");
                    console.log(response);
                }
            },

        },


        created() {
            this.$Progress.start();
            console.log('carrier Component');


            this.$Progress.finish();

        },

        mounted() {
            // console.log('auth Data : ', this.user, this.user.name)
        },


        computed: {
            // map this.count to store.state.count
            ...mapGetters({
                // 'store_data' : 'getRecruitData',
            })
        },




    }

</script>
