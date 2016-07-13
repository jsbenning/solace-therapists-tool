# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160710033531) do

  create_table "clients", force: :cascade do |t|
    t.integer "therapist_id"
    t.string  "medical_record_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "date_of_birth"
    t.string  "address"
    t.string  "phone"
    t.string  "alert",             default: "No current alerts"
  end

  create_table "records", force: :cascade do |t|
    t.integer "client_id",                      default: 0
    t.string  "release_type",                   default: "No assessed value on file"
    t.string  "release_description",            default: "No assessed value on file"
    t.string  "release_initialed",              default: "No assessed value on file"
    t.string  "release_releasee",               default: "No assessed value on file"
    t.string  "release_releasee_info",          default: "No assessed value on file"
    t.string  "release_purpose",                default: "No assessed value on file"
    t.string  "ment_orientation",               default: "No assessed value on file"
    t.string  "ment_appearance",                default: "No assessed value on file"
    t.string  "ment_behavior",                  default: "No assessed value on file"
    t.string  "ment_speech",                    default: "No assessed value on file"
    t.string  "ment_thought",                   default: "No assessed value on file"
    t.string  "ment_affect",                    default: "No assessed value on file"
    t.string  "ment_mood",                      default: "No assessed value on file"
    t.string  "ment_memory",                    default: "No assessed value on file"
    t.string  "ment_concentration",             default: "No assessed value on file"
    t.string  "ment_cognition",                 default: "No assessed value on file"
    t.string  "ment_sleep",                     default: "No assessed value on file"
    t.string  "ment_appetite",                  default: "No assessed value on file"
    t.string  "ment_judgment",                  default: "No assessed value on file"
    t.string  "ment_insight",                   default: "No assessed value on file"
    t.string  "ment_self_behavior",             default: "No assessed value on file"
    t.string  "ment_compulsions",               default: "No assessed value on file"
    t.integer "risk_level",                     default: 0
    t.string  "risk_interventions",             default: "No assessed value on file"
    t.string  "risk_therapist_sign_and_date",   default: "No assessed value on file"
    t.string  "risk_supervisor_sign_and_date",  default: "No assessed value on file"
    t.string  "bio_presenting_problem",         default: "No assessed value on file"
    t.string  "bio_history_presenting_problem", default: "No assessed value on file"
    t.string  "bio_development",                default: "No assessed value on file"
    t.string  "bio_family_hist_probs",          default: "No assessed value on file"
    t.string  "bio_family_hist_dynamics",       default: "No assessed value on file"
    t.string  "bio_abuse",                      default: "No assessed value on file"
    t.string  "bio_reading",                    default: "No assessed value on file"
    t.string  "bio_learning_style",             default: "No assessed value on file"
    t.string  "bio_self_assessment",            default: "No assessed value on file"
    t.string  "bio_barriers",                   default: "No assessed value on file"
    t.string  "bio_teachable",                  default: "No assessed value on file"
    t.string  "bio_family_barriers",            default: "No assessed value on file"
    t.string  "bio_social_function",            default: "No assessed value on file"
    t.string  "bio_community",                  default: "No assessed value on file"
    t.string  "bio_culture",                    default: "No assessed value on file"
    t.string  "bio_finance",                    default: "No assessed value on file"
    t.string  "bio_family_readiness",           default: "No assessed value on file"
    t.string  "bio_strengths_and_challenges",   default: "No assessed value on file"
    t.string  "bio_clinical_analysis",          default: "No assessed value on file"
    t.string  "bio_treatment_recommendations",  default: "No assessed value on file"
    t.string  "bio_other_issues",               default: "No assessed value on file"
    t.string  "bio_dsm",                        default: "No assessed value on file"
    t.string  "bio_sign_and_date",              default: "No assessed value on file"
    t.string  "bio_supervisor_sign_and_date",   default: "No assessed value on file"
    t.string  "sui_ideation_past",              default: "No assessed value on file"
    t.string  "sui_ideation_present",           default: "No assessed value on file"
    t.string  "sui_thoughts_past",              default: "No assessed value on file"
    t.string  "sui_thoughts_present",           default: "No assessed value on file"
    t.string  "sui_freq_past",                  default: "No assessed value on file"
    t.string  "sui_freq_present",               default: "No assessed value on file"
    t.string  "sui_strength_past",              default: "No assessed value on file"
    t.string  "sui_strength_present",           default: "No assessed value on file"
    t.string  "sui_dur_past",                   default: "No assessed value on file"
    t.string  "sui_dur_present",                default: "No assessed value on file"
    t.string  "sui_plan_past",                  default: "No assessed value on file"
    t.string  "sui_plan_present",               default: "No assessed value on file"
    t.string  "sui_intent_past",                default: "No assessed value on file"
    t.string  "sui_intent_present",             default: "No assessed value on file"
    t.string  "sui_attempt_past",               default: "No assessed value on file"
    t.string  "sui_attempt_present",            default: "No assessed value on file"
    t.string  "sui_reason_past",                default: "No assessed value on file"
    t.string  "sui_reason_present",             default: "No assessed value on file"
    t.string  "sui_family_past",                default: "No assessed value on file"
    t.string  "sui_family_present",             default: "No assessed value on file"
    t.string  "sui_deterrents_past",            default: "No assessed value on file"
    t.string  "sui_deterrents_present",         default: "No assessed value on file"
    t.string  "sui_selfinjure_past",            default: "No assessed value on file"
    t.string  "sui_selfinjure_present",         default: "No assessed value on file"
    t.string  "hom_ideation_past",              default: "No assessed value on file"
    t.string  "hom_ideation_present",           default: "No assessed value on file"
    t.string  "hom_thoughts_past",              default: "No assessed value on file"
    t.string  "hom_thoughts_present",           default: "No assessed value on file"
    t.string  "hom_freq_past",                  default: "No assessed value on file"
    t.string  "hom_freq_present",               default: "No assessed value on file"
    t.string  "hom_strength_past",              default: "No assessed value on file"
    t.string  "hom_strength_present",           default: "No assessed value on file"
    t.string  "hom_dur_past",                   default: "No assessed value on file"
    t.string  "hom_dur_present",                default: "No assessed value on file"
    t.string  "hom_control_past",               default: "No assessed value on file"
    t.string  "hom_control_present",            default: "No assessed value on file"
    t.string  "hom_intent_past",                default: "No assessed value on file"
    t.string  "hom_intent_present",             default: "No assessed value on file"
    t.string  "hom_plan_past",                  default: "No assessed value on file"
    t.string  "hom_plan_present",               default: "No assessed value on file"
    t.string  "hom_attempt_past",               default: "No assessed value on file"
    t.string  "hom_attempt_present",            default: "No assessed value on file"
    t.string  "hom_reason_past",                default: "No assessed value on file"
    t.string  "hom_reason_present",             default: "No assessed value on file"
    t.string  "hom_family_past",                default: "No assessed value on file"
    t.string  "hom_family_present",             default: "No assessed value on file"
    t.string  "hom_criminal_past",              default: "No assessed value on file"
    t.string  "hom_criminal_present",           default: "No assessed value on file"
    t.string  "hom_deterrents_past",            default: "No assessed value on file"
    t.string  "hom_deterrents_present",         default: "No assessed value on file"
    t.string  "drug_types",                     default: "No assessed value on file"
    t.string  "drug_denies",                    default: "No assessed value on file"
    t.string  "drug_method_and_amount",         default: "No assessed value on file"
    t.string  "drug_freq",                      default: "No assessed value on file"
    t.integer "drug_age_first_use",             default: 0
    t.integer "drug_age_last_use",              default: 0
    t.string  "drug_forty_eight_hours",         default: "No assessed value on file"
    t.string  "drug_thirty_days",               default: "No assessed value on file"
    t.string  "drug_comments",                  default: "No assessed value on file"
  end

  create_table "therapists", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "license_type"
    t.string "license_number"
  end

end
