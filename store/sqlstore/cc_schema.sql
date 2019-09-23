--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1 (Debian 11.1-3.pgdg90+1)
-- Dumped by pg_dump version 11.1 (Debian 11.1-3.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY call_center.cc_team DROP CONSTRAINT IF EXISTS cc_team_wbt_domain_dc_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_team_acl DROP CONSTRAINT IF EXISTS cc_team_acl_cc_team_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_supervisor_in_team DROP CONSTRAINT IF EXISTS cc_supervisor_in_team_cc_team_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_supervisor_in_team DROP CONSTRAINT IF EXISTS cc_supervisor_in_team_cc_agent_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_skill DROP CONSTRAINT IF EXISTS cc_skill_wbt_domain_dc_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_skill_in_agent DROP CONSTRAINT IF EXISTS cc_skill_in_agent_cc_skils_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_skill_in_agent DROP CONSTRAINT IF EXISTS cc_skill_in_agent_cc_agent_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_resource_in_routing DROP CONSTRAINT IF EXISTS cc_resource_in_routing_cc_queue_routing_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_resource_in_routing DROP CONSTRAINT IF EXISTS cc_resource_in_queue_cc_outbound_resource_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_queue DROP CONSTRAINT IF EXISTS cc_queue_wbt_domain_dc_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_queue_timing DROP CONSTRAINT IF EXISTS cc_queue_timing_cc_queue_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_queue_timing DROP CONSTRAINT IF EXISTS cc_queue_timing_cc_communication_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_queue_routing DROP CONSTRAINT IF EXISTS cc_queue_routing_cc_queue_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_queue DROP CONSTRAINT IF EXISTS cc_queue_cc_team_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_queue DROP CONSTRAINT IF EXISTS cc_queue_cc_list_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_queue DROP CONSTRAINT IF EXISTS cc_queue_calendar_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_outbound_resource DROP CONSTRAINT IF EXISTS cc_outbound_resource_wbt_domain_dc_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_messages DROP CONSTRAINT IF EXISTS cc_member_messages_cc_member_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_messages DROP CONSTRAINT IF EXISTS cc_member_messages_cc_member_communications_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_communications DROP CONSTRAINT IF EXISTS cc_member_communications_cc_member_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_communications DROP CONSTRAINT IF EXISTS cc_member_communications_cc_communication_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member DROP CONSTRAINT IF EXISTS cc_member_cc_queue_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_attempt_log DROP CONSTRAINT IF EXISTS cc_member_attempt_log_cc_queue_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_attempt_log DROP CONSTRAINT IF EXISTS cc_member_attempt_log_cc_member_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_attempt_log DROP CONSTRAINT IF EXISTS cc_member_attempt_log_cc_member_communications_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_attempt DROP CONSTRAINT IF EXISTS cc_member_attempt_cc_queue_timing_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_attempt DROP CONSTRAINT IF EXISTS cc_member_attempt_cc_queue_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_attempt DROP CONSTRAINT IF EXISTS cc_member_attempt_cc_member_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_attempt DROP CONSTRAINT IF EXISTS cc_member_attempt_cc_member_communications_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_list DROP CONSTRAINT IF EXISTS cc_list_wbt_domain_dc_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_list_communications DROP CONSTRAINT IF EXISTS cc_list_communications_cc_list_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent DROP CONSTRAINT IF EXISTS cc_agent_wbt_user_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent DROP CONSTRAINT IF EXISTS cc_agent_wbt_domain_dc_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_state_history DROP CONSTRAINT IF EXISTS cc_agent_status_history_cc_agent_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_activity DROP CONSTRAINT IF EXISTS cc_agent_statistic_cc_agent_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_in_team DROP CONSTRAINT IF EXISTS cc_agent_in_team_cc_team_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_in_team DROP CONSTRAINT IF EXISTS cc_agent_in_team_cc_skils_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_in_team DROP CONSTRAINT IF EXISTS cc_agent_in_team_cc_agent_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_in_queue DROP CONSTRAINT IF EXISTS cc_agent_in_queue_cc_skils_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_in_queue DROP CONSTRAINT IF EXISTS cc_agent_in_queue_cc_queue_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_in_queue DROP CONSTRAINT IF EXISTS cc_agent_in_queue_cc_agent_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_acl DROP CONSTRAINT IF EXISTS cc_agent_acl_cc_agent_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.calendar DROP CONSTRAINT IF EXISTS calendar_wbt_domain_dc_fk;
ALTER TABLE IF EXISTS ONLY call_center.calendar_except DROP CONSTRAINT IF EXISTS calendar_except_calendar_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.calendar DROP CONSTRAINT IF EXISTS calendar_calendar_timezones_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.calendar_acl DROP CONSTRAINT IF EXISTS calendar_acl_calendar_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.calendar_accept_of_day DROP CONSTRAINT IF EXISTS calendar_accept_of_day_calendar_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.acr_routing_variables DROP CONSTRAINT IF EXISTS acr_routing_variables_wbt_domain_dc_fk;
ALTER TABLE IF EXISTS ONLY call_center.acr_routing_scheme DROP CONSTRAINT IF EXISTS acr_routing_scheme_wbt_domain_dc_fk;
ALTER TABLE IF EXISTS ONLY call_center.acr_routing_outbound_call DROP CONSTRAINT IF EXISTS acr_routing_outbound_call_wbt_domain_dc_fk;
ALTER TABLE IF EXISTS ONLY call_center.acr_routing_outbound_call DROP CONSTRAINT IF EXISTS acr_routing_outbound_call_acr_routing_scheme_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.acr_routing_inbound_call DROP CONSTRAINT IF EXISTS acr_routing_inbound_call_wbt_domain_dc_fk;
ALTER TABLE IF EXISTS ONLY call_center.acr_routing_inbound_call DROP CONSTRAINT IF EXISTS acr_routing_inbound_call_calendar_timezones_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.acr_routing_inbound_call DROP CONSTRAINT IF EXISTS acr_routing_inbound_call_acr_routing_scheme_id_fk;
ALTER TABLE IF EXISTS ONLY call_center.acr_routing_inbound_call DROP CONSTRAINT IF EXISTS acr_routing_inbound_call___fka;
DROP TRIGGER IF EXISTS tg_set_routing_ids_on_update_pattern ON call_center.cc_queue_routing;
DROP TRIGGER IF EXISTS tg_set_routing_ids_on_update_number ON call_center.cc_member_communications;
DROP TRIGGER IF EXISTS tg_set_routing_ids_on_insert_or_delete_pattern ON call_center.cc_queue_routing;
DROP TRIGGER IF EXISTS tg_set_routing_ids_on_insert ON call_center.cc_member_communications;
DROP TRIGGER IF EXISTS tg_cc_set_agent_change_status_u ON call_center.cc_agent;
DROP TRIGGER IF EXISTS cc_tg_transfer_attempt_to_log ON call_center.cc_member_attempt;
CREATE OR REPLACE VIEW call_center.cc_queue_distribute_resources AS

DROP STATISTICS IF EXISTS call_center.cc_member_timezone_stats;
DROP INDEX IF EXISTS call_center.cc_team_id_uindex;
DROP INDEX IF EXISTS call_center.cc_team_acl_id_uindex;
DROP INDEX IF EXISTS call_center.cc_supervisor_in_team_id_uindex;
DROP INDEX IF EXISTS call_center.cc_skils_id_uindex;
DROP INDEX IF EXISTS call_center.cc_skill_in_agent_skill_id_agent_id_capacity_uindex;
DROP INDEX IF EXISTS call_center.cc_skill_in_agent_id_uindex;
DROP INDEX IF EXISTS call_center.cc_resource_in_routing_resource_id_routing_id_index;
DROP INDEX IF EXISTS call_center.cc_resource_in_routing_priority_index;
DROP INDEX IF EXISTS call_center.cc_resource_in_queue_id_uindex;
DROP INDEX IF EXISTS call_center.cc_queue_timing_queue_id_communication_id_start_time_of_day_end;
DROP INDEX IF EXISTS call_center.cc_queue_timing_id_uindex;
DROP INDEX IF EXISTS call_center.cc_queue_timing_communication_id_max_attempt_index;
DROP INDEX IF EXISTS call_center.cc_queue_routing_queue_id_index;
DROP INDEX IF EXISTS call_center.cc_queue_routing_id_uindex;
DROP INDEX IF EXISTS call_center.cc_queue_resource_id_uindex;
DROP INDEX IF EXISTS call_center.cc_queue_id_priority_uindex;
DROP INDEX IF EXISTS call_center.cc_queue_enabled_priority_index;
DROP INDEX IF EXISTS call_center.cc_member_timezone_index;
DROP INDEX IF EXISTS call_center.cc_member_queue_id_priority_last_hangup_at_timezone_index;
DROP INDEX IF EXISTS call_center.cc_member_messages_id_uindex;
DROP INDEX IF EXISTS call_center.cc_member_id_index;
DROP INDEX IF EXISTS call_center.cc_member_communications_old_number_idx;
DROP INDEX IF EXISTS call_center.cc_member_communications_old_member_id_routing_ids_idx;
DROP INDEX IF EXISTS call_center.cc_member_communications_old_member_id_id_idx;
DROP INDEX IF EXISTS call_center.cc_member_communications_old_member_id_communication_id_num_idx;
DROP INDEX IF EXISTS call_center.cc_member_communications_old_communication_id_member_id_las_idx;
DROP INDEX IF EXISTS call_center.cc_member_communications_number_index;
DROP INDEX IF EXISTS call_center.cc_member_communications_member_id_communication_test_1;
DROP INDEX IF EXISTS call_center.cc_member_communications_member_id_communication_id_routing_ids;
DROP INDEX IF EXISTS call_center.cc_member_attempt_log_queue_id_idx;
DROP INDEX IF EXISTS call_center.cc_member_attempt_log_hangup_at_index;
DROP INDEX IF EXISTS call_center.cc_member_attempt_log_created_at_index;
DROP INDEX IF EXISTS call_center.cc_member_attempt_id_uindex;
DROP INDEX IF EXISTS call_center.cc_member_agent_id_index;
DROP INDEX IF EXISTS call_center.cc_list_communications_list_id_number_uindex;
DROP INDEX IF EXISTS call_center.cc_list_communications_id_uindex;
DROP INDEX IF EXISTS call_center.cc_communication_id_uindex;
DROP INDEX IF EXISTS call_center.cc_cluster_node_name_uindex;
DROP INDEX IF EXISTS call_center.cc_calls_id_uindex;
DROP INDEX IF EXISTS call_center.cc_call_list_id_uindex;
DROP INDEX IF EXISTS call_center.cc_agent_status_state_id_index;
DROP INDEX IF EXISTS call_center.cc_agent_status_history_id_uindex;
DROP INDEX IF EXISTS call_center.cc_agent_status_history_agent_id_join_at_index;
DROP INDEX IF EXISTS call_center.cc_agent_state_timeout_index;
DROP INDEX IF EXISTS call_center.cc_agent_state_history_agent_id_joined_at_uindex;
DROP INDEX IF EXISTS call_center.cc_agent_in_team_team_id_lvl_index;
DROP INDEX IF EXISTS call_center.cc_agent_in_team_team_id_agent_id_skill_id_lvl_uindex;
DROP INDEX IF EXISTS call_center.cc_agent_in_team_skill_id_team_id_index;
DROP INDEX IF EXISTS call_center.cc_agent_in_team_id_uindex;
DROP INDEX IF EXISTS call_center.cc_agent_in_team_agent_id_index;
DROP INDEX IF EXISTS call_center.cc_agent_in_queue_skill_id_queue_id_uindex;
DROP INDEX IF EXISTS call_center.cc_agent_in_queue_queue_id_lvl_index;
DROP INDEX IF EXISTS call_center.cc_agent_in_queue_queue_id_agent_id_skill_id_lvl_uindex;
DROP INDEX IF EXISTS call_center.cc_agent_in_queue_id_uindex;
DROP INDEX IF EXISTS call_center.cc_agent_in_queue_agent_id_index;
DROP INDEX IF EXISTS call_center.cc_agent_id_uindex;
DROP INDEX IF EXISTS call_center.cc_agent_attempt_id_uindex;
DROP INDEX IF EXISTS call_center.cc_agent_activity_agent_id_last_offering_call_at_uindex;
DROP INDEX IF EXISTS call_center.cc_agent_acl_id_uindex;
DROP INDEX IF EXISTS call_center.calendar_timezones_utc_offset_index;
DROP INDEX IF EXISTS call_center.calendar_timezones_name_uindex;
DROP INDEX IF EXISTS call_center.calendar_timezones_id_uindex;
DROP INDEX IF EXISTS call_center.calendar_id_uindex;
DROP INDEX IF EXISTS call_center.calendar_except_id_uindex;
DROP INDEX IF EXISTS call_center.calendar_domain_id_index;
DROP INDEX IF EXISTS call_center.calendar_accept_of_day_id_uindex;
DROP INDEX IF EXISTS call_center.calendar_accept_of_day_calendar_id_week_day_start_time_of_day_e;
DROP INDEX IF EXISTS call_center.agent_statistic_id_uindex;
DROP INDEX IF EXISTS call_center.acr_routing_variables_id_uindex;
DROP INDEX IF EXISTS call_center.acr_routing_variables_domain_id_index;
DROP INDEX IF EXISTS call_center.acr_routing_scheme_id_uindex;
DROP INDEX IF EXISTS call_center.acr_routing_outbound_call_id_uindex;
DROP INDEX IF EXISTS call_center.acr_routing_inbound_call_id_uindex;
DROP INDEX IF EXISTS call_center.acr_routing_inbound_call_domain_id_numbers_host_disabled_index;
ALTER TABLE IF EXISTS ONLY call_center.cc_team DROP CONSTRAINT IF EXISTS cc_team_pk;
ALTER TABLE IF EXISTS ONLY call_center.cc_team_acl DROP CONSTRAINT IF EXISTS cc_team_acl_pk;
ALTER TABLE IF EXISTS ONLY call_center.cc_supervisor_in_team DROP CONSTRAINT IF EXISTS cc_supervisor_in_team_pk;
ALTER TABLE IF EXISTS ONLY call_center.cc_skill DROP CONSTRAINT IF EXISTS cc_skils_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_skill_in_agent DROP CONSTRAINT IF EXISTS cc_skill_in_agent_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_resource_in_routing DROP CONSTRAINT IF EXISTS cc_resource_in_queue_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_queue_timing DROP CONSTRAINT IF EXISTS cc_queue_timing_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_queue_routing DROP CONSTRAINT IF EXISTS cc_queue_routing_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_outbound_resource DROP CONSTRAINT IF EXISTS cc_queue_resource_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_queue DROP CONSTRAINT IF EXISTS cc_queue_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_member DROP CONSTRAINT IF EXISTS cc_member_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_messages DROP CONSTRAINT IF EXISTS cc_member_messages_pk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_communications_old DROP CONSTRAINT IF EXISTS cc_member_communications_old_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_communications DROP CONSTRAINT IF EXISTS cc_member_communications_id_pk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_attempt DROP CONSTRAINT IF EXISTS cc_member_attempt_pk;
ALTER TABLE IF EXISTS ONLY call_center.cc_member_attempt_log DROP CONSTRAINT IF EXISTS cc_member_attempt_log_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_list_communications DROP CONSTRAINT IF EXISTS cc_list_communications_pk;
ALTER TABLE IF EXISTS ONLY call_center.cc_communication DROP CONSTRAINT IF EXISTS cc_communication_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_cluster DROP CONSTRAINT IF EXISTS cc_cluster_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_calls DROP CONSTRAINT IF EXISTS cc_calls_pk;
ALTER TABLE IF EXISTS ONLY call_center.cc_list DROP CONSTRAINT IF EXISTS cc_call_list_pk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_state_history DROP CONSTRAINT IF EXISTS cc_agent_status_history_pk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent DROP CONSTRAINT IF EXISTS cc_agent_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_in_team DROP CONSTRAINT IF EXISTS cc_agent_in_team_pk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_in_queue DROP CONSTRAINT IF EXISTS cc_agent_in_queue_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_attempt DROP CONSTRAINT IF EXISTS cc_agent_attempt_pk;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_acl DROP CONSTRAINT IF EXISTS cc_agent_acl_pk;
ALTER TABLE IF EXISTS ONLY call_center.calendar_timezones DROP CONSTRAINT IF EXISTS calendar_timezones_pk;
ALTER TABLE IF EXISTS ONLY call_center.calendar DROP CONSTRAINT IF EXISTS calendar_pkey;
ALTER TABLE IF EXISTS ONLY call_center.calendar_except DROP CONSTRAINT IF EXISTS calendar_except_pkey;
ALTER TABLE IF EXISTS ONLY call_center.calendar_accept_of_day DROP CONSTRAINT IF EXISTS calendar_accept_of_day_pkey;
ALTER TABLE IF EXISTS ONLY call_center.cc_agent_activity DROP CONSTRAINT IF EXISTS agent_statistic_pk;
ALTER TABLE IF EXISTS ONLY call_center.acr_routing_variables DROP CONSTRAINT IF EXISTS acr_routing_variables_pk;
ALTER TABLE IF EXISTS ONLY call_center.acr_routing_scheme DROP CONSTRAINT IF EXISTS acr_routing_scheme_pk;
ALTER TABLE IF EXISTS ONLY call_center.acr_routing_outbound_call DROP CONSTRAINT IF EXISTS acr_routing_outbound_call_pk;
ALTER TABLE IF EXISTS ONLY call_center.acr_routing_inbound_call DROP CONSTRAINT IF EXISTS acr_routing_inbound_call_pk;
ALTER TABLE IF EXISTS call_center.cc_team_acl ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_team ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_supervisor_in_team ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_skill_in_agent ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_skill ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_resource_in_routing ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_queue_timing ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_queue_routing ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_queue ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_outbound_resource ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_member_messages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_member_communications ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_member_attempt ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_member ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_list_communications ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_list ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_communication ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_cluster ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_calls ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_agent_state_history ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_agent_in_team ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_agent_in_queue ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_agent_attempt ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_agent_activity ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_agent_acl ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.cc_agent ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.calendar_timezones ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.calendar_except ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.calendar_accept_of_day ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.calendar ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.acr_routing_variables ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.acr_routing_scheme ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.acr_routing_outbound_call ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS call_center.acr_routing_inbound_call ALTER COLUMN id DROP DEFAULT;
DROP VIEW IF EXISTS call_center.members_in_queue;
DROP SEQUENCE IF EXISTS call_center.cc_team_id_seq;
DROP SEQUENCE IF EXISTS call_center.cc_team_acl_id_seq;
DROP TABLE IF EXISTS call_center.cc_team_acl;
DROP TABLE IF EXISTS call_center.cc_team;
DROP SEQUENCE IF EXISTS call_center.cc_supervisor_in_team_id_seq;
DROP TABLE IF EXISTS call_center.cc_supervisor_in_team;
DROP SEQUENCE IF EXISTS call_center.cc_skils_id_seq;
DROP SEQUENCE IF EXISTS call_center.cc_skill_in_agent_id_seq;
DROP SEQUENCE IF EXISTS call_center.cc_resource_in_queue_id_seq;
DROP TABLE IF EXISTS call_center.cc_resource_in_routing;
DROP SEQUENCE IF EXISTS call_center.cc_queue_timing_id_seq;
DROP TABLE IF EXISTS call_center.cc_queue_timing;
DROP SEQUENCE IF EXISTS call_center.cc_queue_routing_id_seq;
DROP TABLE IF EXISTS call_center.cc_queue_routing;
DROP VIEW IF EXISTS call_center.cc_queue_resources_is_working;
DROP SEQUENCE IF EXISTS call_center.cc_queue_resource_id_seq;
DROP VIEW IF EXISTS call_center.cc_queue_is_working;
DROP SEQUENCE IF EXISTS call_center.cc_queue_id_seq;
DROP TABLE IF EXISTS call_center.cc_queue;
DROP SEQUENCE IF EXISTS call_center.cc_member_messages_id_seq;
DROP TABLE IF EXISTS call_center.cc_member_messages;
DROP SEQUENCE IF EXISTS call_center.cc_member_id_seq;
DROP TABLE IF EXISTS call_center.cc_member_communications_old;
DROP SEQUENCE IF EXISTS call_center.cc_member_communications_id_seq;
DROP TABLE IF EXISTS call_center.cc_member_attempt_log;
DROP SEQUENCE IF EXISTS call_center.cc_member_attempt_id_seq;
DROP TABLE IF EXISTS call_center.cc_member_attempt;
DROP TABLE IF EXISTS call_center.cc_member;
DROP SEQUENCE IF EXISTS call_center.cc_list_communications_id_seq;
DROP TABLE IF EXISTS call_center.cc_list_communications;
DROP SEQUENCE IF EXISTS call_center.cc_communication_id_seq;
DROP TABLE IF EXISTS call_center.cc_communication;
DROP SEQUENCE IF EXISTS call_center.cc_cluster_id_seq;
DROP TABLE IF EXISTS call_center.cc_cluster;
DROP SEQUENCE IF EXISTS call_center.cc_calls_id_seq;
DROP TABLE IF EXISTS call_center.cc_calls;
DROP SEQUENCE IF EXISTS call_center.cc_call_list_id_seq;
DROP TABLE IF EXISTS call_center.cc_list;
DROP SEQUENCE IF EXISTS call_center.cc_agent_in_team_id_seq;
DROP TABLE IF EXISTS call_center.cc_agent_in_team;
DROP SEQUENCE IF EXISTS call_center.cc_agent_in_queue_id_seq;
DROP SEQUENCE IF EXISTS call_center.cc_agent_id_seq;
DROP SEQUENCE IF EXISTS call_center.cc_agent_history_id_seq;
DROP TABLE IF EXISTS call_center.cc_agent_state_history;
DROP SEQUENCE IF EXISTS call_center.cc_agent_attempt_id_seq;
DROP TABLE IF EXISTS call_center.cc_agent_attempt;
DROP SEQUENCE IF EXISTS call_center.cc_agent_acl_id_seq;
DROP TABLE IF EXISTS call_center.cc_agent_acl;
DROP SEQUENCE IF EXISTS call_center.calendar_timezones_id_seq;
DROP MATERIALIZED VIEW IF EXISTS call_center.calendar_timezones_by_interval;
DROP TABLE IF EXISTS call_center.calendar_timezones;
DROP SEQUENCE IF EXISTS call_center.calendar_id_seq;
DROP SEQUENCE IF EXISTS call_center.calendar_except_id_seq;
DROP TABLE IF EXISTS call_center.calendar_except;
DROP TABLE IF EXISTS call_center.calendar_acl;
DROP SEQUENCE IF EXISTS call_center.calendar_accept_of_day_id_seq;
DROP TABLE IF EXISTS call_center.calendar_accept_of_day;
DROP VIEW IF EXISTS call_center.available_agent_in_queue;
DROP TABLE IF EXISTS call_center.cc_skill_in_agent;
DROP TABLE IF EXISTS call_center.cc_skill;
DROP TABLE IF EXISTS call_center.cc_agent_in_queue;
DROP TABLE IF EXISTS call_center.cc_agent;
DROP SEQUENCE IF EXISTS call_center.agent_statistic_id_seq;
DROP TABLE IF EXISTS call_center.cc_agent_activity;
DROP SEQUENCE IF EXISTS call_center.acr_routing_variables_id_seq;
DROP TABLE IF EXISTS call_center.acr_routing_variables;
DROP SEQUENCE IF EXISTS call_center.acr_routing_scheme_id_seq;
DROP TABLE IF EXISTS call_center.acr_routing_scheme;
DROP SEQUENCE IF EXISTS call_center.acr_routing_outbound_call_id_seq;
DROP TABLE IF EXISTS call_center.acr_routing_outbound_call;
DROP SEQUENCE IF EXISTS call_center.acr_routing_inbound_call_id_seq;
DROP TABLE IF EXISTS call_center.acr_routing_inbound_call;
DROP FUNCTION IF EXISTS call_center.un_reserve_members_with_resources(node character varying, res character varying);
DROP FUNCTION IF EXISTS call_center.tg_get_member_communication_resource();
DROP FUNCTION IF EXISTS call_center.tg_fill_member_communication_resource();
DROP FUNCTION IF EXISTS call_center.reserve_members_with_resources(node_id character varying);
DROP FUNCTION IF EXISTS call_center.index_page(relname text, pageno integer);
DROP FUNCTION IF EXISTS call_center.heap_page(relname text, pageno integer);
DROP FUNCTION IF EXISTS call_center.get_outbound_resources(_filter text, _orderby text, _desc boolean, _limit integer, _offset integer);
DROP TABLE IF EXISTS call_center.cc_outbound_resource;
DROP FUNCTION IF EXISTS call_center.get_free_resources();
DROP FUNCTION IF EXISTS call_center.get_count_call(integer);
DROP FUNCTION IF EXISTS call_center.get_count_active_resources(integer);
DROP FUNCTION IF EXISTS call_center.get_calendars(_filter text, _orderby text, _desc boolean, _limit integer, _offset integer);
DROP TABLE IF EXISTS call_center.calendar;
DROP FUNCTION IF EXISTS call_center.get_available_member_communication(integer);
DROP FUNCTION IF EXISTS call_center.get_agents_for_queue(_queue_id bigint);
DROP FUNCTION IF EXISTS call_center.get_agents_available_count_by_queue_id(_queue_id integer);
DROP FUNCTION IF EXISTS call_center.fn_idx_test(r text);
DROP FUNCTION IF EXISTS call_center.fn_idx_test(r record);
DROP FUNCTION IF EXISTS call_center.flush_daily_counts_queue2();
DROP FUNCTION IF EXISTS call_center.flush_daily_counts_queue();
DROP FUNCTION IF EXISTS call_center.f_add_task_for_call();
DROP FUNCTION IF EXISTS call_center.cc_waiting_agents(team_id_ bigint, limit_ integer, strategy_ character varying);
DROP FUNCTION IF EXISTS call_center.cc_unreserve_members_with_resources(node character varying, res character varying);
DROP FUNCTION IF EXISTS call_center.cc_un_reserve_members_with_resources(node character varying, res character varying);
DROP FUNCTION IF EXISTS call_center.cc_transfer_attempt_to_log();
DROP FUNCTION IF EXISTS call_center.cc_test_time(timezone_ jsonb);
DROP FUNCTION IF EXISTS call_center.cc_test_time(timezone_ interval);
DROP FUNCTION IF EXISTS call_center.cc_test_pair(call_center.cc_member_communications);
DROP TABLE IF EXISTS call_center.cc_member_communications;
DROP FUNCTION IF EXISTS call_center.cc_test_calendar(timezone_ character varying);
DROP FUNCTION IF EXISTS call_center.cc_stop_attempt(_attempt_id bigint, _delta smallint, _state smallint, _hangup_at bigint, _cause character varying);
DROP FUNCTION IF EXISTS call_center.cc_set_attempt_success(_attempt_id bigint, _hangup_at bigint, _logs jsonb, _cause character varying);
DROP FUNCTION IF EXISTS call_center.cc_set_attempt_stop(_attempt_id bigint, _delta smallint, _is_err boolean, _hangup_at bigint, _logs jsonb, _cause character varying);
DROP FUNCTION IF EXISTS call_center.cc_set_attempt_barred(_attempt_id bigint, _hangup_at bigint, _logs jsonb, _cause character varying);
DROP FUNCTION IF EXISTS call_center.cc_set_agent_state_set_leaving_at();
DROP FUNCTION IF EXISTS call_center.cc_set_agent_change_status();
DROP FUNCTION IF EXISTS call_center.cc_set_active_members(node character varying);
DROP FUNCTION IF EXISTS call_center.cc_resource_set_error(_id bigint, _routing_id bigint, _error_id character varying, _strategy character varying);
DROP FUNCTION IF EXISTS call_center.cc_reserved_agent_for_attempt(_node_id character varying);
DROP FUNCTION IF EXISTS call_center.cc_reserve_members_with_resources(node_id character varying);
DROP FUNCTION IF EXISTS call_center.cc_queue_timing_timezones(queue_id_ bigint, calendar_id_ bigint);
DROP FUNCTION IF EXISTS call_center.cc_queue_timing_communication_ids(_queue_id bigint);
DROP FUNCTION IF EXISTS call_center.cc_queue_require_resources(integer);
DROP FUNCTION IF EXISTS call_center.cc_queue_require_agents(integer);
DROP FUNCTION IF EXISTS call_center.cc_queue_distribute_progressive(node_ character varying, rec call_center.cc_queue_distribute_resources);
DROP FUNCTION IF EXISTS call_center.cc_queue_distribute_preview(node_ character varying, rec call_center.cc_queue_distribute_resources);
DROP FUNCTION IF EXISTS call_center.cc_queue_distribute_ivr(node character varying, rec call_center.cc_queue_distribute_resources);
DROP VIEW IF EXISTS call_center.cc_queue_distribute_resources;
DROP FUNCTION IF EXISTS call_center.cc_queue_actual_timing(_queue_id bigint);
DROP FUNCTION IF EXISTS call_center.cc_originate_communication(_attempt_id bigint, _member_id bigint, _communication_id bigint, _state smallint);
DROP FUNCTION IF EXISTS call_center.cc_interval_to_arr(i_ interval);
DROP FUNCTION IF EXISTS call_center.cc_get_time(_t character varying, _def_t character varying);
DROP FUNCTION IF EXISTS call_center.cc_get_lookup(_id bigint, _name character varying);
DROP FUNCTION IF EXISTS call_center.cc_distribute_inbound_call_to_queue(_queue_id bigint, _call_id character varying, _number character varying, _name character varying, _priority integer);
DROP FUNCTION IF EXISTS call_center.cc_distribute_agent_to_attempt(_node_id character varying);
DROP FUNCTION IF EXISTS call_center.cc_confirm_agent_attempt(_agent_id bigint, _attempt_id bigint);
DROP FUNCTION IF EXISTS call_center.cc_available_agents_by_strategy(_queue_id bigint, _strategy character varying, _limit integer, _last_agents bigint[], _except_agents bigint[]);
DROP FUNCTION IF EXISTS call_center.calendar_accept_of_day_timezones(calendar_id_ bigint);
DROP FUNCTION IF EXISTS call_center.agent_by_queue_strategy(_queue_id bigint, _strategy character varying);
DROP TYPE IF EXISTS call_center.cc_type;
DROP TYPE IF EXISTS call_center.cc_pair_test;
DROP TYPE IF EXISTS call_center.cc_communication_type_l;
DROP TYPE IF EXISTS call_center.cc_communication_t;
DROP TYPE IF EXISTS call_center.cc_agent_in_attempt;
DROP SCHEMA IF EXISTS call_center;
--
-- Name: call_center; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA call_center;


--
-- Name: cc_agent_in_attempt; Type: TYPE; Schema: call_center; Owner: -
--

CREATE TYPE call_center.cc_agent_in_attempt AS (
	attempt_id bigint,
	agent_id bigint
);


--
-- Name: cc_communication_t; Type: TYPE; Schema: call_center; Owner: -
--

CREATE TYPE call_center.cc_communication_t AS (
	number character varying(50),
	priority integer,
	state integer,
	routing_ids integer[]
);


--
-- Name: cc_communication_type_l; Type: TYPE; Schema: call_center; Owner: -
--

CREATE TYPE call_center.cc_communication_type_l AS (
	type_id integer,
	l interval[]
);

SELECT
    NULL::integer AS queue_id,
    NULL::integer AS resource_id,
    NULL::integer[] AS routing_ids,
    NULL::bigint AS min_activity_at,
    NULL::integer AS call_count,
    NULL::bigint AS dnc_list_id,
    NULL::call_center.cc_communication_type_l[] AS times,
    NULL::smallint AS type,
    NULL::character varying(20) AS strategy,
    NULL::jsonb AS payload,
    NULL::bigint AS team_id;

--
-- Name: cc_pair_test; Type: TYPE; Schema: call_center; Owner: -
--

CREATE TYPE call_center.cc_pair_test AS (
	c integer,
	a integer
);


--
-- Name: cc_type; Type: TYPE; Schema: call_center; Owner: -
--

CREATE TYPE call_center.cc_type AS ENUM (
    'inbound',
    'ivr',
    'preview',
    'progressive',
    'predictive'
);


--
-- Name: agent_by_queue_strategy(bigint, character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.agent_by_queue_strategy(_queue_id bigint, _strategy character varying) RETURNS TABLE(agent_ids integer[])
    LANGUAGE plpgsql
    AS $_$
  declare
    sql text;
BEGIN
    if _strategy = 'ring-all' then
      return query
          select array_agg(aq.agent_id)::int[]
          from available_agent_in_queue aq
          where aq.queue_id = _queue_id;
    else
      sql = format('select (array[aq.agent_id])::int[]
      from available_agent_in_queue aq
        inner join cc_agent a on a.id = aq.agent_id
        left join cc_agent_in_queue_statistic s on s.agent_id = aq.agent_id and aq.queue_id = $1
      where aq.queue_id = $1
      order by aq.max_of_lvl desc,
      ')
        || case _strategy
            when 'longest-idle-time' then 's.ready_time desc nulls first'
            --r r
            --t d
            when 'least-talk-time' then 's.last_bridge_end asc nulls first'
            when 'fewest-calls' then 's.calls_answered asc nulls first'
           else 'random()' end
      ;

      return query execute sql using _queue_id;
    end if ;

    --raise notice '% = %',_strategy, sql;


END;
$_$;


--
-- Name: calendar_accept_of_day_timezones(bigint); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.calendar_accept_of_day_timezones(calendar_id_ bigint) RETURNS interval[]
    LANGUAGE plpgsql STRICT COST 10
    AS $$
  declare
    res_ interval[];
begin
    select array_agg(distinct t.utc_offset)
    into res_
    from calendar_timezones t,
         lateral (select current_timestamp AT TIME ZONE t.name t) with_timezone
    where exists(
              select 1
              from calendar_accept_of_day a
              where a.calendar_id = calendar_id_
                and a.week_day = extract(dow from with_timezone.t)
                and (to_char(with_timezone.t, 'SSSS') :: int / 60) between a.start_time_of_day and a.end_time_of_day
            );
    return res_;
end;
$$;


--
-- Name: cc_available_agents_by_strategy(bigint, character varying, integer, bigint[], bigint[]); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_available_agents_by_strategy(_queue_id bigint, _strategy character varying, _limit integer, _last_agents bigint[], _except_agents bigint[]) RETURNS SETOF integer[]
    LANGUAGE sql
    AS $$
  select ARRAY(
    select a.id
    from get_agents_for_queue(_queue_id) t
    inner join cc_agent a on t.agent_id = a.id
    inner join cc_agent_activity ac on t.agent_id = ac.agent_id
    where a.status = 'online' and a.state = 'waiting'
      and not exists(select  1 from cc_member_attempt at where at.hangup_at = 0 and at.state > 0 and at.agent_id = a.id)
      and (_except_agents isnull or not _except_agents::bigint[] && array[a.id]::bigint[])
    order by
     --a.id,
     case when _last_agents && array[a.id::bigint] then 1 else null end asc nulls last,
     t.lvl desc, t.capacity desc,
     ac.last_offering_call_at asc
    limit _limit
  );
$$;


--
-- Name: cc_confirm_agent_attempt(bigint, bigint); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_confirm_agent_attempt(_agent_id bigint, _attempt_id bigint) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    declare cnt int;
BEGIN
    update cc_member_attempt
    set bridged_at = case id when _attempt_id then 1 else 0 end,
        result = case id when _attempt_id then null else 'ABANDONED' end,
        state = case id when _attempt_id then state else 7 end
    where agent_id = _agent_id and not exists(
       select 1
       from cc_member_attempt a
       where a.agent_id = _agent_id and a.result notnull
       for update
    );
    get diagnostics cnt = row_count;
    return cnt::int;
END;
$$;


--
-- Name: cc_distribute_agent_to_attempt(character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_distribute_agent_to_attempt(_node_id character varying) RETURNS SETOF call_center.cc_agent_in_attempt
    LANGUAGE plpgsql
    AS $$
declare
  rec RECORD;
  agents bigint[];
  reserved_agents bigint[] := array[0];
  at cc_agent_in_attempt;
  counter int := 0;
BEGIN
FOR rec IN select cq.id::bigint queue_id, cq.strategy::varchar(50), count(*)::int as cnt,
                     array_agg((a.id, la.agent_id)::cc_agent_in_attempt order by a.created_at asc, a.weight desc )::cc_agent_in_attempt[] ids, array_agg(distinct la.agent_id) filter ( where not la.agent_id isnull )  last_agents
           from cc_member_attempt a
            inner join cc_queue cq on a.queue_id = cq.id
            left join lateral (
             select a1.agent_id
             from cc_member_attempt a1
             where a1.member_id = a.member_id and a1.created_at < a.created_at
             order by a1.created_at desc
             limit 1
           ) la on true
           where a.hangup_at = 0 and a.agent_id isnull and a.state = 3
            and a.created_at >= (extract(EPOCH  from current_timestamp)::bigint - cq.sec_locate_agent)
           group by cq.id
           order by cq.priority desc
   LOOP
    select cc_available_agents_by_strategy(rec.queue_id, rec.strategy, rec.cnt, rec.last_agents, reserved_agents)
    into agents;

    raise notice '% >>> %',rec, agents;

    counter := 0;
    foreach at IN ARRAY rec.ids
    LOOP
      if array_length(agents, 1) isnull then
        exit;
      end if;

      counter := counter + 1;

      if at.agent_id isnull OR not (agents && array[at.agent_id]) then
        at.agent_id = agents[array_upper(agents, 1)];
      end if;

      select agents::int[] - at.agent_id::int, reserved_agents::int[] || at.agent_id::int
      into agents, reserved_agents;

      return next at;
    END LOOP;
   END LOOP;

   --raise notice '%', reserved_agents;

  return;
END;
$$;


--
-- Name: cc_distribute_inbound_call_to_queue(bigint, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_distribute_inbound_call_to_queue(_queue_id bigint, _call_id character varying, _number character varying, _name character varying, _priority integer DEFAULT 0) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
declare
    _attempt_id bigint = null;
    _member_id bigint;
    _communication_id bigint;
BEGIN

  select cm.id, cc.id
  from cc_member_communications cc
    inner join cc_member cm on cc.member_id = cm.id
  where cc.number = _number and cm.queue_id = _queue_id
  limit 1
  into _member_id, _communication_id;


  if _member_id isnull  then
    insert into cc_member(queue_id, name, priority, timezone, "offset")
    values (_queue_id, _name, _priority, 'UTC', '0h'::interval) --TODO
    returning id into _member_id;


    insert into cc_member_communications (member_id, priority, number)
    values (_member_id, _priority, _number)
    returning id into _communication_id;
  end if;

  insert into cc_member_attempt (state, communication_id, queue_id, member_id, weight, leg_a_id)
  values (0, _communication_id, _queue_id, _member_id, _priority, _call_id)
  returning id into _attempt_id;

  --raise notice '%', _attempt_id;

  return _attempt_id;

END;
$$;


--
-- Name: cc_get_lookup(bigint, character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_get_lookup(_id bigint, _name character varying) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
BEGIN
    if _id isnull then
        return null;
    else
        return json_build_object('id', _id, 'name', _name)::jsonb;
    end if;
END;
$$;


--
-- Name: cc_get_time(character varying, character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_get_time(_t character varying, _def_t character varying) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
  return (to_char(current_timestamp AT TIME ZONE coalesce(_t, _def_t), 'SSSS') :: int / 60)::int;
END;
$$;


--
-- Name: cc_interval_to_arr(interval); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_interval_to_arr(i_ interval) RETURNS interval[]
    LANGUAGE plpgsql IMMUTABLE STRICT COST 900
    AS $$
BEGIN
  return array [i_]::interval [];
END;
$$;


--
-- Name: cc_originate_communication(bigint, bigint, bigint, smallint); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_originate_communication(_attempt_id bigint, _member_id bigint, _communication_id bigint, _state smallint) RETURNS TABLE(name character varying, variables jsonb, number character varying, description character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	return query with att as (
		update cc_member_attempt
			set state = _state,
				originate_at = ((date_part('epoch'::text, now()) * (1000)::double precision))::bigint
			where id = _attempt_id and communication_id = _communication_id and member_id = _member_id
			returning id, originate_at::bigint
	)
	select m.name, m.variables, c.number, c.description
	from cc_member m,
		 lateral (
				select *
				from cc_member_communications
				where id = _communication_id
			) c
	where m.id = _member_id and exists(select * from att);
END;
$$;


--
-- Name: cc_queue_actual_timing(bigint); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_queue_actual_timing(_queue_id bigint) RETURNS TABLE(communication_id bigint, max_attempt integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  return query select t.communication_id::bigint, max(t.max_attempt::integer) - 10
    from cc_queue_timing t
    where t.queue_id = _queue_id and -1 between t.start_time_of_day and t.end_time_of_day
    group by t.communication_id;

end;
$$;


--
-- Name: cc_queue_distribute_resources; Type: VIEW; Schema: call_center; Owner: -
--

CREATE VIEW call_center.cc_queue_distribute_resources AS
SELECT
    NULL::integer AS queue_id,
    NULL::integer AS resource_id,
    NULL::integer[] AS routing_ids,
    NULL::bigint AS min_activity_at,
    NULL::integer AS call_count,
    NULL::bigint AS dnc_list_id,
    NULL::call_center.cc_communication_type_l[] AS times,
    NULL::smallint AS type,
    NULL::character varying(20) AS strategy,
    NULL::jsonb AS payload,
    NULL::bigint AS team_id;


--
-- Name: cc_queue_distribute_ivr(character varying, call_center.cc_queue_distribute_resources); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_queue_distribute_ivr(node character varying, rec call_center.cc_queue_distribute_resources) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
  declare
    v_cnt integer;
    count integer = 0;
    seg_cnt integer;
    x cc_communication_type_l;
BEGIN
    seg_cnt = 0;

    foreach x in array rec.times
    loop
      execute 'insert into cc_member_attempt(result, communication_id, queue_id, member_id, resource_id, routing_id, node_id)
      select
             case when lc.number is null then null else ''OUTGOING_CALL_BARRED'' end,
             t.communication_id,
             $2,
             t.member_id,
             $7,
             t.routing_id,
             $8
      from (
        select
           c.communication_id,
           c.communication_number,
           c.member_id,
          (c.routing_ids & $1::int[])[1] as routing_id,
           row_number() over (partition by c.member_id order by c.last_hangup_at, c.priority desc) d
        from (
          select cmc.id as communication_id, cmc.number as communication_number, cmc.routing_ids, cmc.last_hangup_at, cmc.priority, cmc.member_id
          from cc_member m
           cross join cc_member_communications cmc
              where m.queue_id = $2
                and not exists(
                select *
                from cc_member_attempt a
                where a.member_id = m.id and a.state > 0
              )
              and m.stop_at = 0
              and m.last_hangup_at < $3
              and m."offset"::interval = any ($4::interval[])

              and cmc.member_id = m.id
              and cmc.state = 0
              and cmc.routing_ids && $1
              and cmc.communication_id = $5

            order by m.priority desc, m.last_hangup_at asc
          limit $6 * 3 --todo 3 is avg communication count
        ) c
      ) t
      left join cc_list_communications lc on lc.list_id = $9 and lc.number = t.communication_number
      where t.d =1
      limit $6'
        using
          rec.routing_ids::int[],
          rec.queue_id::bigint,
          rec.min_activity_at,
          x.l::interval [],
          x.type_id::int,
          rec.call_count::int - seg_cnt,
          rec.resource_id::int,
          node::text,
          rec.dnc_list_id::bigint;

      get diagnostics v_cnt = row_count;
      count = count + v_cnt;
      seg_cnt = seg_cnt + v_cnt;

      exit when rec.call_count::int - seg_cnt <= 0;
    end loop;

    return  count;
END;
$_$;


--
-- Name: cc_queue_distribute_preview(character varying, call_center.cc_queue_distribute_resources); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_queue_distribute_preview(node_ character varying, rec call_center.cc_queue_distribute_resources) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
 declare
  v_cnt integer;
  count integer = 0;
  seg_cnt integer;
  x cc_communication_type_l;
BEGIN
    seg_cnt = 0;
    
    if rec.team_id isnull then 
      return 0;
    end if;

    foreach x in array rec.times
    loop
      execute 'insert into cc_member_attempt(result, communication_id, member_id, routing_id, agent_id, resource_id, queue_id , node_id)
              select
                 case when lc.number is null then null else ''OUTGOING_CALL_BARRED'' end result,
                 t.communication_id,
                 t.member_id,
                 t.routing_id,
                 a.agent_id as agent_id,
                 $1 as queue_id,
                 $2 as resource_id,
                 $3 as node_name
              from (
                select
                     c.communication_id,
                     c.communication_number,
                     c.member_id,
                    (c.routing_ids & $4::int[])[1] as routing_id,
                     row_number() over (partition by c.member_id order by c.last_hangup_at, c.priority desc) d,
                     dense_rank()  over (order by  c.member_id) ra
                    from (
                      select cmc.id as communication_id, cmc.number as communication_number, cmc.routing_ids, cmc.last_hangup_at, cmc.priority, cmc.member_id
                      from cc_member m
                       cross join cc_member_communications cmc
                          where m.queue_id = $1
                            and not exists(
                            select *
                            from cc_member_attempt a
                            where a.member_id = m.id and a.state > 0
                          )
                          and m.stop_at = 0
                          and m.last_hangup_at < $5
                          and m."offset"::interval =  any ($6::interval[])

                          and cmc.member_id = m.id
                          and cmc.state = 0
                          and cmc.routing_ids && $4::int[]
                          and cmc.communication_id = $7

                        order by m.priority desc, m.last_hangup_at asc
                      limit $8 * 3 for UPDATE SKIP LOCKED --todo 3 is avg communication count
                ) c
              ) t
              left join cc_list_communications lc on lc.list_id = 1 and lc.number = t.communication_number
              cross join cc_waiting_agents($9, $8, null) a
              where t.d = 1 and t.ra = a.pos and not exists(
                  select 1
                  from cc_member_attempt a1
                  where a1.agent_id = a.agent_id
              )
              limit $8'
          using
            rec.queue_id::bigint,
            rec.resource_id::int,
            node_,
            rec.routing_ids::int[],
            rec.min_activity_at,
            x.l,
            x.type_id,
            rec.call_count::int - seg_cnt,
            rec.team_id;

      get diagnostics v_cnt = row_count;
      count = count + v_cnt;
      seg_cnt = seg_cnt + v_cnt;

      exit when rec.call_count::int - seg_cnt <= 0;
    end loop;

  return count;
END;
$_$;


--
-- Name: cc_queue_distribute_progressive(character varying, call_center.cc_queue_distribute_resources); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_queue_distribute_progressive(node_ character varying, rec call_center.cc_queue_distribute_resources) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
 declare
  v_cnt integer;
  count integer = 0;
  seg_cnt integer;
  x cc_communication_type_l;
BEGIN
    seg_cnt = 0;

    foreach x in array rec.times
    loop
      execute 'insert into cc_member_attempt(result, communication_id, member_id, routing_id, agent_id, queue_id, resource_id, node_id)
              select
                 t.result,
                 t.communication_id,
                 t.member_id,
                 t.routing_id,
                 a.agent_id as agent_id,
                  $1 as queue_id,
                  $2 as resource_id,
                  $3 as node_name
            from (
              select
                     row_number() over  (partition by ra % $10 order by result nulls first ) rn,
                     *
                from (
                  select
                   case when lc.number is null then null else ''OUTGOING_CALL_BARRED'' end result,
                   t.communication_id,
                   t.member_id,
                   t.routing_id,
                   row_number() over (order by lc.number nulls first, t.member_id ) ra,
                   t.d
                  from (
                    select
                         c.communication_id,
                         c.communication_number,
                         c.member_id,
                        (c.routing_ids & $4::int[])[1] as routing_id,
                         row_number() over (partition by c.member_id order by c.last_hangup_at, c.priority desc) d
                        from (
                          select cmc.id as communication_id, cmc.number as communication_number, cmc.routing_ids, cmc.last_hangup_at, cmc.priority, cmc.member_id
                          from cc_member m
                           cross join cc_member_communications cmc
                              where m.queue_id = $1
                                and not exists(
                                select *
                                from cc_member_attempt a
                                where a.member_id = m.id and a.state > 0
                              )
                              and m.stop_at = 0
                              and m.last_hangup_at < $5
                              and m."offset"::interval = any ($6::interval[])

                              and cmc.member_id = m.id
                              and cmc.state = 0
                              and cmc.routing_ids && $4::int[]
                              and cmc.communication_id = $7

                            order by m.priority desc, m.last_hangup_at asc
                          limit $8 * 3 --todo 3 is avg communication count
                    ) c
                  ) t
                  left join cc_list_communications lc on lc.list_id = 1 and lc.number = t.communication_number
                  where t.d = 1
                ) t
            ) t
            left join cc_waiting_agents($1, $8, $9) a on a.pos = t.rn and t.result isnull
            where (a.agent_id isnull and t.result notnull ) or a.agent_id notnull
            limit $8'
          using
            rec.queue_id::bigint,
            rec.resource_id::int,
            node_,
            rec.routing_ids::int[],
            rec.min_activity_at,
            x.l,
            x.type_id,
            rec.call_count::int - seg_cnt,
            (rec.payload->'agent'->'strategy')::varchar(50),
            coalesce((rec.payload->'agent'->>'call_per_agent')::int, 1)::int;

      get diagnostics v_cnt = row_count;
      count = count + v_cnt;
      seg_cnt = seg_cnt + v_cnt;

      exit when rec.call_count::int - seg_cnt <= 0;
    end loop;

  return count;
END;
$_$;


--
-- Name: cc_queue_require_agents(integer); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_queue_require_agents(integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
BEGIN
  if $1 = 2 then
    return false;
  end if;
  RETURN true;
END
$_$;


--
-- Name: cc_queue_require_resources(integer); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_queue_require_resources(integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
BEGIN
  if $1 = 1 then
    return false;
  end if;
  RETURN true;
END
$_$;


--
-- Name: cc_queue_timing_communication_ids(bigint); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_queue_timing_communication_ids(_queue_id bigint) RETURNS integer[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  return array(select distinct cqt.communication_id
from cc_queue q
  inner join calendar c on q.calendar_id = c.id
  inner join cc_queue_timing cqt on q.id = cqt.queue_id
where q.id = _queue_id
  and (to_char(current_timestamp AT TIME ZONE c.timezone, 'SSSS') :: int / 60)
    between cqt.start_time_of_day and cqt.end_time_of_day);
END;
$$;


--
-- Name: cc_queue_timing_timezones(bigint, bigint); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_queue_timing_timezones(queue_id_ bigint, calendar_id_ bigint) RETURNS call_center.cc_communication_type_l[]
    LANGUAGE plpgsql
    AS $$
declare res_types cc_communication_type_l[];
  declare res_type cc_communication_type_l;
  declare r record;
  declare i int default 0;
BEGIN
  for r in select t.id
           , t.communication_id
           , t.priority
           , z.ofs
      from cc_queue_timing t,
           lateral (
              select array_agg(distinct ct.utc_offset) ofs
              from calendar_timezones_by_interval ct,
                   lateral (select current_timestamp AT TIME ZONE ct.names[1] t) with_timezone
              where (to_char(with_timezone.t, 'SSSS') :: int / 60)
                  between t.start_time_of_day and t.end_time_of_day
                   and exists (
                      select 1
                      from calendar_accept_of_day a
                      where a.calendar_id = calendar_id_
                        and a.week_day = extract(dow from with_timezone.t) + 1
                        and (to_char(with_timezone.t, 'SSSS') :: int / 60) between a.start_time_of_day and a.end_time_of_day

                  )
           ) z
      where t.queue_id = queue_id_ and z.ofs notnull
      order by priority desc
  loop

    if res_types[i] notnull and (res_types[i]::cc_communication_type_l).type_id = r.communication_id  then

      SELECT r.communication_id::int, array_agg(distinct t.v)::interval[]
      into res_type
      from (
           select unnest(array_cat(res_types[i].l, r.ofs)) v
      ) t
      limit 1;

      res_types[i] = res_type;
    else
      SELECT
             array_append(res_types, (r.communication_id, r.ofs)::cc_communication_type_l)
      into res_types;
      i = i + 1;
    end if;

  end loop;
  return res_types;
END;
$$;


--
-- Name: cc_reserve_members_with_resources(character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_reserve_members_with_resources(node_id character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    rec cc_queue_distribute_resources;
    count integer = 0;
BEGIN

    if NOT pg_try_advisory_xact_lock(13213211) then
      raise notice 'LOCK';
      return 0;
    end if;


    FOR rec IN select
          *
      from cc_queue_distribute_resources
    LOOP

      case rec.type
        when 1 then
          select count +  r
          into count
          from cc_queue_distribute_ivr(node_id::varchar(50), rec) r;
        when 2 then
          select count +  r
          into count
          from cc_queue_distribute_preview(node_id::varchar(50), rec) r;
        when 3 then
          select count +  r
          into count
          from cc_queue_distribute_progressive(node_id::varchar(50), rec) r;
        else
          raise exception 'not implement type %', rec.type;
        end CASE;

    END LOOP;
    return count;
END;
$$;


--
-- Name: cc_reserved_agent_for_attempt(character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_reserved_agent_for_attempt(_node_id character varying) RETURNS TABLE(attempt_id bigint, agent_id bigint, agent_updated_at bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY update cc_member_attempt a
    set agent_id = res.agent_id
    from (
    with tmp as (
      select *, row_number() over (partition by tmp.queue_id order by tmp.queue_id) rn --TODO strategy
        from (
          select distinct on(a.agent_id) a.agent_id, a.queue_id
          from available_agent_in_queue a
          order by a.agent_id, a.ratio desc
        ) tmp
      )
      select r.id as attempt_id, r.queue_id, tmp.agent_id
      from (
        select *, row_number() over (partition by queue_id order by created_at) rn
        from cc_member_attempt a
        where a.hangup_at = 0 and a.state = 3 and a.agent_id isnull
      ) r
      inner join tmp on r.queue_id = tmp.queue_id and r.rn = tmp.rn
    ) res
    inner join cc_agent ag on ag.id = res.agent_id
    where a.id = res.attempt_id and a.agent_id isnull
    returning a.id::bigint as attempt_id, a.agent_id::bigint, ag.updated_at::bigint as agent_updated_at;
END;
$$;


--
-- Name: cc_resource_set_error(bigint, bigint, character varying, character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_resource_set_error(_id bigint, _routing_id bigint, _error_id character varying, _strategy character varying) RETURNS record
    LANGUAGE plpgsql
    AS $$
DECLARE _res record;
  _stopped boolean;
  _successively_errors smallint;
  _un_reserved_id bigint;
BEGIN

  update cc_outbound_resource
  set last_error_id = _error_id,
      last_error_at = ((date_part('epoch'::text, now()) * (1000)::double precision))::bigint,
    successively_errors = successively_errors + 1,
    enabled = case when successively_errors + 1 >= max_successively_errors then false else enabled end
  where id = _id and "enabled" is true
  returning successively_errors >= max_successively_errors, successively_errors into _stopped, _successively_errors
  ;
  
  if _stopped is true then
    update cc_outbound_resource o
    set reserve = false,
        successively_errors = 0
    from (
      select id
      from cc_outbound_resource r
      where r.enabled is true
        and r.reserve is true
        and exists(
          select *
          from cc_resource_in_routing crir
          where crir.routing_id = _routing_id
            and crir.resource_id = r.id
        )
      order by case when _strategy = 'top_down' then r.last_error_at else null end asc,
               case _strategy
                 when 'by_limit' then r."limit"
                 when 'random' then random()
               else null
               end desc
      limit 1
    ) r
    where r.id = o.id
    returning o.id::bigint into _un_reserved_id;
  end if;
  
  select _successively_errors::smallint, _stopped::boolean, _un_reserved_id::bigint into _res;
  return _res;
END;
$$;


--
-- Name: cc_set_active_members(character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_set_active_members(node character varying) RETURNS TABLE(id bigint, member_id bigint, communication_id bigint, result character varying, queue_id integer, queue_updated_at bigint, queue_count integer, queue_active_count integer, resource_id integer, resource_updated_at bigint, routing_id integer, routing_pattern character varying, destination character varying, description character varying, variables jsonb, name character varying, leg_a_id character varying, agent_id bigint, agent_updated_at bigint, team_updated_at bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query update cc_member_attempt a
      set state = 1
        ,node_id = node
        ,result = case c.state when 3 then 'TIMEOUT' when 7 then 'CANCEL' else a.result end
      from (
--         with stats as (
--           select a.queue_id,
--                  count(*)                            count,
--                  count(*) filter ( where state = 5 ) active
--           from cc_member_attempt a
--           where a.hangup_at = 0
--           group by a.queue_id
--         )
        select c.id,
               cq.updated_at   as queue_updated_at,
               r.updated_at    as resource_updated_at,
               qr.id           as routing_id,
               qr.pattern      as routing_pattern,
               cmc.number      as destination,
               cmc.description as description,
               cm.variables    as variables,
               cm.name         as member_name,
               c.state         as state,
               cq.sec_locate_agent,
--                s.count as queue_cnt,
               0 as queue_cnt,
--                s.active as queue_active_cnt
               0 as queue_active_cnt,
               ca.updated_at as agent_updated_at,
               tm.updated_at as team_updated_at
        from cc_member_attempt c
               --inner join stats s on s.queue_id = c.queue_id
               inner join cc_member cm on c.member_id = cm.id
               inner join cc_member_communications cmc on cmc.id = c.communication_id
               inner join cc_queue cq on cm.queue_id = cq.id
               left join cc_team tm on tm.id = cq.team_id
               left join cc_queue_routing qr on qr.id = c.routing_id
               left join cc_outbound_resource r on r.id = c.resource_id
               left join cc_agent ca on c.agent_id = ca.id
        where (c.state = 0
                or (c.state = 3 and c.agent_id isnull and cq.sec_locate_agent > 0 and c.created_at <= (extract(EPOCH  from current_timestamp)::bigint - cq.sec_locate_agent) * 1000)
                or c.state = 7
          ) and c.hangup_at = 0
        order by cq.priority desc, c.weight desc
                 for update of c skip locked
      ) c
      where a.id = c.id
      returning
        a.id::bigint as id,
        a.member_id::bigint as member_id,
        a.communication_id::bigint as communication_id,
        a.result as result,
        a.queue_id::int as qeueue_id,
        c.queue_updated_at::bigint as queue_updated_at,
        c.queue_cnt::int,
        c.queue_active_cnt::int,
        a.resource_id::int as resource_id,
        c.resource_updated_at::bigint as resource_updated_at,
        c.routing_id,
        c.routing_pattern,
        c.destination,
        c.description,
        c.variables,
        c.member_name,
        a.leg_a_id,
        a.agent_id,
        c.agent_updated_at,
        c.team_updated_at;
END;
$$;


--
-- Name: cc_set_agent_change_status(); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_set_agent_change_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  insert into cc_agent_state_history (agent_id, joined_at, state)
  values (new.id, now(), new.state);
  RETURN new;
END;
$$;


--
-- Name: cc_set_agent_state_set_leaving_at(); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_set_agent_state_set_leaving_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  update cc_agent_status_history h
    set leaving_at  =  new.join_at
  from (
    select h.id
    from cc_agent_status_history h
    where h.agent_id = new.agent_id
    order by h.join_at desc
    limit 1
    for update --todo
  ) prev
  where h.id = prev.id;

  RETURN new;
END;
$$;


--
-- Name: cc_set_attempt_barred(bigint, bigint, jsonb, character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_set_attempt_barred(_attempt_id bigint, _hangup_at bigint, _logs jsonb, _cause character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cnt int;
  _stopped boolean;
  _member_id bigint;
  _communication_id bigint;
BEGIN
     update cc_member_attempt
     set hangup_at = _hangup_at,
         state = -1, --todo
         result = _cause,
         logs = _logs
     where id = _attempt_id
     returning member_id, communication_id into _member_id, _communication_id;

     GET DIAGNOSTICS _cnt = ROW_COUNT;

     if _cnt = 0 then
       RAISE EXCEPTION 'not found attempt';
     end if;

     update cc_member_communications c
      set state = 1,
          last_hangup_cause = _cause,
          last_hangup_at = _hangup_at
     where c.id = _communication_id;

     GET DIAGNOSTICS _cnt = ROW_COUNT;

     if _cnt = 0 then
       RAISE EXCEPTION 'not found communication';
     end if;

     _stopped = false;
     if not exists(select * from cc_member_communications where member_id = _member_id and state = 0) then
       update cc_member m
        set stop_at = _hangup_at,
            last_hangup_at = _hangup_at,
            stop_cause = _cause
       where m.id = _member_id;

       _stopped = true;
     end if;

  return _stopped;
END;
$$;


--
-- Name: cc_set_attempt_stop(bigint, smallint, boolean, bigint, jsonb, character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_set_attempt_stop(_attempt_id bigint, _delta smallint, _is_err boolean, _hangup_at bigint, _logs jsonb, _cause character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
--   _cnt int;
  _stopped boolean;
  _break boolean;
  _member_id bigint;
  _communication_id bigint;
BEGIN
     update cc_member_attempt
     set hangup_at = _hangup_at,
         state = -1, --todo
         result = _cause,
         logs = _logs
     where id = _attempt_id
     returning member_id, communication_id into _member_id, _communication_id;


     if _member_id isnull then
       RAISE EXCEPTION 'not found attempt';
     end if;

     update cc_member_communications c
      set state = case when _is_err then 1 else state end,
          attempts = attempts + _delta,
          last_hangup_cause = _cause,
          last_hangup_at = _hangup_at
     where c.id = _communication_id and _delta != 0;

--      if _cnt = 0 and _delta != 0 then
--        RAISE EXCEPTION 'not found communication';
--      end if;

     update cc_member m
     set attempts = attempts + _delta,
         stop_cause = case when (q.max_of_retry <= attempts + _delta) or c.cnt = 0 then _cause else stop_cause end,
         stop_at = case when (q.max_of_retry <= attempts + _delta) or c.cnt = 0 then _hangup_at else stop_at end,
         last_hangup_at = _hangup_at
     from cc_queue q,
          lateral (
             select count(c.id) as cnt
             from cc_member_communications c
             where c.member_id = _member_id and c.state = 0
          ) c
     where m.id = _member_id and q.id = m.queue_id and _delta != 0
     returning stop_at > 0, c.cnt > 0 into _stopped, _break;

--      GET DIAGNOSTICS _cnt = ROW_COUNT;
--
--      if _cnt = 0 and _delta != 0 then
--        RAISE EXCEPTION 'not found member in attempt';
--      end if;

     if _stopped is true and _break is true then
--
--        update cc_member_communications
--         set state = 1
--        where member_id = _member_id and id != _communication_id;
     end if;

     if _stopped isnull then
       _stopped = false;
     end if;

     return _stopped;
END;
$$;


--
-- Name: cc_set_attempt_success(bigint, bigint, jsonb, character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_set_attempt_success(_attempt_id bigint, _hangup_at bigint, _logs jsonb, _cause character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cnt int;
  _member_id bigint;
  _communication_id bigint;
BEGIN
     update cc_member_attempt
     set hangup_at = _hangup_at,
         state = -2, --todo
         result = _cause,
         logs = _logs
     where id = _attempt_id
     returning member_id, communication_id into _member_id, _communication_id;

     GET DIAGNOSTICS _cnt = ROW_COUNT;

     if _cnt = 0 then
       RAISE EXCEPTION 'not found attempt';
     end if;

     update cc_member
     set attempts = attempts + 1,
         stop_cause = _cause,
         stop_at = _hangup_at,
         last_hangup_at = _hangup_at
     where id = _member_id;

     GET DIAGNOSTICS _cnt = ROW_COUNT;

     if _cnt = 0 then
       RAISE EXCEPTION 'not found member in attempt';
     end if;

     update cc_member_communications
      set state = 1,
          attempts = case _communication_id when id then attempts + 1 else attempts end,
          last_hangup_at = case _communication_id when id then _hangup_at else last_hangup_at end,
          last_hangup_cause = case _communication_id when id then _cause else last_hangup_cause end
     where member_id = _member_id;

     GET DIAGNOSTICS _cnt = ROW_COUNT;

     if _cnt = 0 then
       RAISE EXCEPTION 'not found member communications';
     end if;
END;
$$;


--
-- Name: cc_stop_attempt(bigint, smallint, smallint, bigint, character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_stop_attempt(_attempt_id bigint, _delta smallint, _state smallint, _hangup_at bigint, _cause character varying) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _member_id bigint;
  _communication_id bigint;
BEGIN

     update cc_member_attempt
     set hangup_at = _hangup_at,
         state = _state,
         result = _cause
     where id = _attempt_id
     returning communication_id into _communication_id;

     update
       cc_member_communications
     set attempts = attempts + _delta,
         last_hangup_at = _hangup_at,
         last_hangup_cause = coalesce(_cause, '') -- todo
     where id = _communication_id
     returning member_id into  _member_id;


     update cc_member m
      set stop_cause = _cause,
          stop_at = _hangup_at
     from cc_queue q
     where _delta != 0 and m.id = _member_id and q.id = m.queue_id
       and q.max_of_retry <= (select sum(attempts) from cc_member_communications where member_id = _member_id)
     returning m.id into _member_id;


     return _member_id;
END;
$$;


--
-- Name: cc_test_calendar(character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_test_calendar(timezone_ character varying) RETURNS boolean
    LANGUAGE plpgsql COST 999
    AS $$
BEGIN
  return false;
END;
$$;


SET default_tablespace = '';

--
-- Name: cc_member_communications; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_member_communications (
    id integer NOT NULL,
    member_id integer NOT NULL,
    priority smallint DEFAULT 0 NOT NULL,
    number character varying(20) NOT NULL,
    last_originate_at bigint DEFAULT 0 NOT NULL,
    state smallint DEFAULT 0 NOT NULL,
    communication_id integer,
    routing_ids integer[],
    description character varying(100) DEFAULT ''::character varying,
    last_hangup_at bigint DEFAULT 0 NOT NULL,
    attempts bigint DEFAULT 0 NOT NULL,
    last_hangup_cause character varying(50) DEFAULT ''::character varying NOT NULL
);


--
-- Name: cc_test_pair(call_center.cc_member_communications); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_test_pair(call_center.cc_member_communications) RETURNS call_center.cc_pair_test
    LANGUAGE sql
    AS $_$
    select row($1.communication_id, $1.attempts)::cc_pair_test
$_$;


--
-- Name: cc_test_time(interval); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_test_time(timezone_ interval) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE COST 10
    AS $$
BEGIN
  return false;
END;
$$;


--
-- Name: cc_test_time(jsonb); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_test_time(timezone_ jsonb) RETURNS bigint
    LANGUAGE plpgsql IMMUTABLE COST 10
    AS $$
BEGIN
  return 0;
END;
$$;


--
-- Name: cc_transfer_attempt_to_log(); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_transfer_attempt_to_log() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  with rem as (
    delete from cc_member_attempt a
      where a.id = new.id
      returning *
  )
  insert
  into cc_member_attempt_log (id, communication_id, timing_id, queue_id, state, member_id, created_at, weight,
                              hangup_at, bridged_at, resource_id, leg_a_id, leg_b_id, node_id, result,
                              originate_at, answered_at, routing_id, logs, agent_id)
  select id,
         communication_id,
         timing_id,
         queue_id,
         state,
         member_id,
         created_at,
         weight,
         hangup_at,
         bridged_at,
         resource_id,
         leg_a_id,
         leg_b_id,
         node_id,
         result,
         originate_at,
         answered_at,
         routing_id,
         logs,
         agent_id
  from rem;
  
  return new;
END;
$$;


--
-- Name: cc_un_reserve_members_with_resources(character varying, character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_un_reserve_members_with_resources(node character varying, res character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    count integer;
BEGIN
    update cc_member_attempt
      set state  = -1,
          hangup_at = ((date_part('epoch'::text, now()) * (1000)::double precision))::bigint,
          result = res
    where hangup_at = 0 and node_id = node and state = 0;

    get diagnostics count = row_count;
    return count;
END;
$$;


--
-- Name: cc_unreserve_members_with_resources(character varying, character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_unreserve_members_with_resources(node character varying, res character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    count integer;
BEGIN
    update cc_member_attempt
      set state  = -1,
          hangup_at = ((date_part('epoch'::text, now()) * (1000)::double precision))::bigint,
          result = res
    where hangup_at = 0 and node_id = node and state = 0;

    get diagnostics count = row_count;
    return count;
END;
$$;


--
-- Name: cc_waiting_agents(bigint, integer, character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.cc_waiting_agents(team_id_ bigint, limit_ integer, strategy_ character varying) RETURNS TABLE(agent_id bigint, pos integer)
    LANGUAGE plpgsql COST 70
    AS $$
BEGIN
  return query select distinct on(a.agent_id) a.agent_id::bigint agent_id, (row_number() over (order by a.lvl, a.capacity desc))::int as pos
  from (
    select aq.agent_id, aq.lvl, aq.capacity
    from (

      select sa.agent_id, max(aq.lvl) lvl, max(sa.capacity) capacity
       from cc_agent_in_team aq
          inner join cc_skill_in_agent sa on sa.skill_id = aq.skill_id
       where aq.team_id = team_id_ and aq.skill_id notnull and sa.capacity between aq.min_capacity and aq.max_capacity
       group by sa.agent_id

      union distinct

      select aq.agent_id, lvl, 0
      from cc_agent_in_team aq
      where aq.team_id = team_id_ and aq.agent_id notnull
    ) aq
      inner join cc_agent a on a.id = aq.agent_id
    where a.state = 'waiting' and a.status = 'online' and not exists(
        select 1
        from cc_member_attempt at
        where at.agent_id = a.id
    )
    order by aq.lvl, aq.capacity desc, random()
    limit limit_
  ) a;
END;
$$;


--
-- Name: f_add_task_for_call(); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.f_add_task_for_call() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
  i_cnt integer;
BEGIN
  if pg_try_advisory_lock(77515154878) != true
  then
    return -1;
  end if;

  insert into cc_member_attempt (communication_id, queue_id, member_id, weight)

    select
      m.cc_id as communication_id,
      q.id    as queue_id,
      m.id ,
      row_number() over (order by q.priority desc )
    from cc_queue_is_working q
      , lateral (select case when q.max_calls - q.active_calls <= 0
      then 0
                        else q.max_calls - q.active_calls end) as qq(need_calls)
      inner join lateral (
                 select
                   c.cc_id as cc_id,
                   m.id
                 from cc_member m
                   inner join lateral (
                              select
                                id as cc_id,
                                queue_id,
                                number,
                                communication_id
                              from cc_member_communications c
                              where c.member_id = m.id and c.state = 0 and last_calle_at <= q.sec_between_retries
                              order by last_calle_at, priority
                              limit 1
                              ) as c on true

                 where m.queue_id = q.id
                       and not exists(select 1
                                      from cc_member_attempt a
                                      where a.member_id = m.id and a.state = 0)
                       and pg_try_advisory_xact_lock('cc_member_communications' :: regclass :: oid :: integer, m.id)
                 order by m.priority asc
                 limit qq.need_calls
                 ) m on true
    order by q.priority desc;
  GET DIAGNOSTICS i_cnt = ROW_COUNT;

  RETURN i_cnt; -- true if INSERT
END
$$;


--
-- Name: flush_daily_counts_queue(); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.flush_daily_counts_queue() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  SET transaction ISOLATION LEVEL SERIALIZABLE;
  update cc_queue
  set priority = priority + 1 + (select 1
                                 from pg_sleep(10)
                                 limit 1)
  where cc_queue.id = 1;
  return true;
  commit;

  EXCEPTION --exception within loop
  WHEN OTHERS
    THEN
      begin

        RAISE INFO 'Error Name:%', SQLERRM;

        RAISE INFO 'Error State:%', SQLSTATE;
      end;

      return false;


END;
$$;


--
-- Name: flush_daily_counts_queue2(); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.flush_daily_counts_queue2() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN

  SET transaction ISOLATION LEVEL SERIALIZABLE;

  update cc_queue
  set priority = priority + 1 + (select 1
                                 from pg_sleep(10)
                                 limit 1)
    where cc_queue.id = 1;


  EXCEPTION --exception within loop
  WHEN OTHERS
    THEN ROLLBACK;

  return;
  commit ;


END;
$$;


--
-- Name: fn_idx_test(record); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.fn_idx_test(r record) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
    return length(r.number) > 5;
END;
$$;


--
-- Name: fn_idx_test(text); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.fn_idx_test(r text) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
    return length(r) > 5;
END;
$$;


--
-- Name: get_agents_available_count_by_queue_id(integer); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.get_agents_available_count_by_queue_id(_queue_id integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
BEGIN
  return query select (count(distinct  COALESCE(aq.agent_id, csia.agent_id)))::integer as cnt
    from cc_agent_in_queue aq
       left join cc_skill cs on aq.skill_id = cs.id
       left join cc_skill_in_agent csia on cs.id = csia.skill_id
    where aq.queue_id = _queue_id
      --and COALESCE(aq.agent_id, csia.agent_id) notnull
      and  COALESCE(aq.agent_id, csia.agent_id) not in (
        select a.agent_id
        from cc_member_attempt a
        where a.state > 0 and not a.agent_id isnull
      );
END;
$$;


--
-- Name: get_agents_for_queue(bigint); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.get_agents_for_queue(_queue_id bigint) RETURNS TABLE(agent_id bigint, capacity integer, lvl integer)
    LANGUAGE sql
    AS $$
  select
        (COALESCE(aq.agent_id, csia.agent_id))::bigint as agent_id,
        (COALESCE(max(csia.capacity), 0))::int capacity,
        (max(aq.lvl))::int lvl
      from cc_agent_in_queue aq
        left join cc_skill_in_agent csia on aq.skill_id = csia.skill_id
      where aq.queue_id = _queue_id
      group by aq.queue_id, COALESCE(aq.agent_id, csia.agent_id);
$$;


--
-- Name: get_available_member_communication(integer); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.get_available_member_communication(integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NOT pg_try_advisory_xact_lock(1) THEN
         RAISE NOTICE 'skipping queue flush';
         RETURN ;
    END IF;

    perform pg_sleep(10);

 END
$$;


SET default_with_oids = false;

--
-- Name: calendar; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.calendar (
    id integer NOT NULL,
    start integer,
    finish integer,
    name character varying(20) NOT NULL,
    domain_id bigint NOT NULL,
    description character varying(200),
    timezone_id integer NOT NULL
);


--
-- Name: get_calendars(text, text, boolean, integer, integer); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.get_calendars(_filter text, _orderby text, _desc boolean, _limit integer, _offset integer) RETURNS SETOF call_center.calendar
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
 _empty text := '';
BEGIN
   RETURN QUERY EXECUTE FORMAT('SELECT
     *
   from calendar where ($1 = $2 OR name ILIKE $1)
   order by %I %s
   limit ($3)
   offset ($4)', _orderby, case _desc when true then 'DESC' else 'ASC' end)
   USING _filter, _empty, _limit, _offset;
END
$_$;


--
-- Name: get_count_active_resources(integer); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.get_count_active_resources(integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $_$
BEGIN
  RETURN QUERY SELECT count(*) :: integer
               FROM cc_member_attempt a
               WHERE hangup_at = 0
                 AND a.resource_id = $1;
END
$_$;


--
-- Name: get_count_call(integer); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.get_count_call(integer) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $_$
BEGIN
  RETURN QUERY SELECT count(*) :: integer
               FROM cc_member_attempt
               WHERE hangup_at = 0 AND queue_id = $1; -- AND state > -1; TODO
  RETURN;
END
$_$;


--
-- Name: get_free_resources(); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.get_free_resources() RETURNS TABLE(queue_id integer, resource_id integer, routing_ids integer[], call_count integer, sec_between_retries integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY
    with rr as (
      select q.id as q_id,
             q.sec_between_retries,
             cor.id resource_id,
             q.need_call as q_cnt,
             (case when cor.max_call_count - cor.reserved_count <= 0 then
               0 else cor.max_call_count - cor.reserved_count end) r_cnt,

             --todo absolute to calc priority!!!
             round(100.0 * (q.need_call + 1) / NULLIF(SUM(q.need_call + 1) OVER(partition by cor.id),0)) AS "ratio",
             array_agg(r.id order by r.priority desc, crir2.priority desc) as routing_ids
      from cc_queue_is_working q
             inner join cc_queue_routing r on q.id = r.queue_id
             inner join cc_resource_in_routing crir2 on r.id = crir2.routing_id
             inner join cc_queue_resources_is_working cor on crir2.resource_id = cor.id
      where q.need_call > 0 and q.type != 0
--           and exists (
--             select * from cc_member_communications cmc
--             where cmc.state = 0 and cmc.routing_ids && array[r.id])
      group by q.id, q.sec_between_retries, q.need_call, cor.id, cor.max_call_count, cor.reserved_count

    ), res_s as (
        select * ,
               sum(cnt) over (partition by rr.q_id order by ratio desc ) s
        from rr,
             lateral (select round(rr.ratio * rr.r_cnt / 100) ) resources_by_ration(cnt)
      ),
      res as (
        select *, coalesce(lag(s) over(partition by q_id order by ratio desc), 0) as lag_sum
        from res_s
      )
      select res.q_id::int, res.resource_id::int, res.routing_ids::int[],
             (case when s < q_cnt then res.cnt else res.q_cnt - res.lag_sum end)::int call_count,
             res.sec_between_retries
      from res
    where res.lag_sum < res.q_cnt;
END;
$$;


--
-- Name: cc_outbound_resource; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_outbound_resource (
    id integer NOT NULL,
    "limit" integer DEFAULT 0 NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    updated_at integer NOT NULL,
    rps integer DEFAULT '-1'::integer,
    domain_id bigint,
    reserve boolean DEFAULT false,
    variables jsonb DEFAULT '{}'::jsonb NOT NULL,
    number character varying(20) NOT NULL,
    max_successively_errors integer DEFAULT 0,
    name character varying(50) NOT NULL,
    dial_string character varying(50) NOT NULL,
    error_ids jsonb DEFAULT '[]'::jsonb NOT NULL,
    last_error_id character varying(50),
    successively_errors smallint DEFAULT 0 NOT NULL,
    last_error_at bigint DEFAULT 0
);


--
-- Name: get_outbound_resources(text, text, boolean, integer, integer); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.get_outbound_resources(_filter text, _orderby text, _desc boolean, _limit integer, _offset integer) RETURNS SETOF call_center.cc_outbound_resource
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
 _empty text := '';
BEGIN
   RETURN QUERY EXECUTE FORMAT('SELECT
     *
   from cc_outbound_resource where ($1 = $2 OR name ILIKE $1)
   order by %I %s
   limit ($3)
   offset ($4)', _orderby, case _desc when true then 'DESC' else 'ASC' end)
   USING _filter, _empty, _limit, _offset;
END
$_$;


--
-- Name: heap_page(text, integer); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.heap_page(relname text, pageno integer) RETURNS TABLE(ctid tid, state text, xmin text, xmax text, hhu text, hot text, t_ctid tid)
    LANGUAGE sql
    AS $$
SELECT (pageno,lp)::text::tid AS ctid,
       CASE lp_flags
         WHEN 0 THEN 'unused'
         WHEN 1 THEN 'normal'
         WHEN 2 THEN 'redirect to '||lp_off
         WHEN 3 THEN 'dead'
       END AS state,
       t_xmin || CASE
         WHEN (t_infomask & 256) > 0 THEN ' (c)'
         WHEN (t_infomask & 512) > 0 THEN ' (a)'
         ELSE ''
       END AS xmin,
       t_xmax || CASE
         WHEN (t_infomask & 1024) > 0 THEN ' (c)'
         WHEN (t_infomask & 2048) > 0 THEN ' (a)'
         ELSE ''
       END AS xmax,
       CASE WHEN (t_infomask2 & 16384) > 0 THEN 't' END AS hhu,
       CASE WHEN (t_infomask2 & 32768) > 0 THEN 't' END AS hot,
       t_ctid
FROM heap_page_items(get_raw_page(relname,pageno))
ORDER BY lp;
$$;


--
-- Name: index_page(text, integer); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.index_page(relname text, pageno integer) RETURNS TABLE(itemoffset smallint, ctid tid)
    LANGUAGE sql
    AS $$
SELECT itemoffset,
       ctid
FROM bt_page_items(relname,pageno);
$$;


--
-- Name: reserve_members_with_resources(character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.reserve_members_with_resources(node_id character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    rec RECORD;
    count integer;
    v_cnt integer;
BEGIN
    count = 0;


    if NOT pg_try_advisory_xact_lock(13213211) then
      raise notice 'LOCK';
      return 0;
    end if;


    FOR rec IN SELECT r.*, q.dnc_list_id, cc_queue_timing_communication_ids(r.queue_id) as type_ids
      from get_free_resources() r
        inner join cc_queue q on q.id = r.queue_id
      where r.call_count > 0
      group by r.queue_id, resource_id, routing_ids, call_count, r.sec_between_retries, q.id
      order by q.priority desc
    LOOP
      insert into cc_member_attempt(result, communication_id, queue_id, member_id, resource_id, routing_id, node_id)
      select
              case when lc.number is null then null else 'OUTGOING_CALL_BARRED' end,
             t.communication_id,
             rec.queue_id,
             t.member_id,
             rec.resource_id,
             t.routing_id,
             node_id
      from (
        select
               c.*,
              (c.routing_ids & rec.routing_ids)[1] as routing_id,
               row_number() over (partition by c.member_id order by c.last_hangup_at, c.priority desc) d
        from (
          select c.id as communication_id, c.number as communication_number, c.routing_ids, c.last_hangup_at, c.priority, c.member_id
          from cc_member cm
           cross join cc_member_communications c
              where
                not exists(
                  select *
                  from cc_member_attempt a
                  where a.member_id = cm.id and a.state > 0
                )
                and cm.last_hangup_at < ((date_part('epoch'::text, now()) * (1000)::double precision))::bigint
                                          - (rec.sec_between_retries * 1000)
                and cm.stop_at = 0
                and cm.queue_id = rec.queue_id

                and c.state = 0
                and ( (c.communication_id = any(rec.type_ids) ) or c.communication_id isnull )
                and c.member_id = cm.id
                and c.routing_ids && rec.routing_ids

            order by cm.priority desc
          limit rec.call_count * 3 --todo 3 is avg communication count
        ) c
      ) t
      left join cc_list_communications lc on lc.list_id = rec.dnc_list_id and lc.number = t.communication_number
      where t.d =1
      limit rec.call_count;

      get diagnostics v_cnt = row_count;
      count = count + v_cnt;
    END LOOP;
    return count;
END;
$$;


--
-- Name: tg_fill_member_communication_resource(); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.tg_fill_member_communication_resource() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

  if (tg_op = 'UPDATE' or tg_op = 'DELETE') then
    update cc_member_communications c
    set routing_ids = c.routing_ids - ARRAY [old.id]
    where c.id in (
      select c1.id
      from cc_member_communications c1
      	inner join cc_member cm on c1.member_id = cm.id
      where c1.routing_ids @> ARRAY [old.id] and cm.queue_id = old.queue_id
    );
  end if;

--  raise notice 'end delete';
  if (tg_op = 'UPDATE' or tg_op = 'INSERT') then

    update cc_member_communications c
    set routing_ids = c.routing_ids | ARRAY [new.id]
		from cc_member_communications c1
			inner join cc_member cm on c1.member_id = cm.id
		where c1.id = c.id and cm.queue_id = new.queue_id and not c1.routing_ids @> ARRAY [new.id]
        and c1.number ~* new.pattern;
  end if;

--  raise notice 'end add';
  RETURN new;
END;
$$;


--
-- Name: tg_get_member_communication_resource(); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.tg_get_member_communication_resource() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  --TODO change to STATEMENT !!!
  new.routing_ids = ARRAY(select r.id
  from cc_queue_routing r
  where r.queue_id = (select queue_id from cc_member m where m.id = new.member_id)
        and new.number ~ r.pattern
  );
 --raise notice 'TG "%" % -> %', new.routing_ids, new.member_id, new.number;

 RETURN new;
END;
$$;


--
-- Name: un_reserve_members_with_resources(character varying, character varying); Type: FUNCTION; Schema: call_center; Owner: -
--

CREATE FUNCTION call_center.un_reserve_members_with_resources(node character varying, res character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    count integer;
BEGIN
    update cc_member_attempt
      set state  = -1,
          hangup_at = ((date_part('epoch'::text, now()) * (1000)::double precision))::bigint,
          result = res
    where hangup_at = 0 and node_id = node and state = 0;

    get diagnostics count = row_count;
    return count;
END;
$$;


--
-- Name: acr_routing_inbound_call; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.acr_routing_inbound_call (
    id bigint NOT NULL,
    domain_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) DEFAULT ''::character varying NOT NULL,
    created_at bigint NOT NULL,
    created_by bigint NOT NULL,
    updated_at bigint NOT NULL,
    updated_by bigint NOT NULL,
    start_scheme_id bigint NOT NULL,
    stop_scheme_id bigint,
    numbers character varying(50)[] DEFAULT '{}'::character varying[] NOT NULL,
    host character varying(50),
    timezone_id integer NOT NULL,
    debug boolean DEFAULT false NOT NULL,
    disabled boolean DEFAULT false
);


--
-- Name: acr_routing_inbound_call_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.acr_routing_inbound_call_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: acr_routing_inbound_call_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.acr_routing_inbound_call_id_seq OWNED BY call_center.acr_routing_inbound_call.id;


--
-- Name: acr_routing_outbound_call; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.acr_routing_outbound_call (
    id bigint NOT NULL,
    domain_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) DEFAULT ''::character varying NOT NULL,
    created_at bigint NOT NULL,
    created_by bigint NOT NULL,
    updated_at bigint NOT NULL,
    updated_by bigint NOT NULL,
    pattern character varying(50) NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    disabled boolean DEFAULT false,
    scheme_id bigint NOT NULL
);


--
-- Name: acr_routing_outbound_call_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.acr_routing_outbound_call_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: acr_routing_outbound_call_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.acr_routing_outbound_call_id_seq OWNED BY call_center.acr_routing_outbound_call.id;


--
-- Name: acr_routing_scheme; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.acr_routing_scheme (
    id bigint NOT NULL,
    domain_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    scheme jsonb NOT NULL,
    payload jsonb,
    type smallint DEFAULT 0 NOT NULL,
    created_at bigint NOT NULL,
    created_by bigint NOT NULL,
    updated_at bigint NOT NULL,
    updated_by bigint NOT NULL,
    description character varying(200) DEFAULT ''::character varying NOT NULL,
    debug boolean DEFAULT false NOT NULL
);


--
-- Name: acr_routing_scheme_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.acr_routing_scheme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: acr_routing_scheme_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.acr_routing_scheme_id_seq OWNED BY call_center.acr_routing_scheme.id;


--
-- Name: acr_routing_variables; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.acr_routing_variables (
    id bigint NOT NULL,
    domain_id bigint NOT NULL,
    key character varying(20) NOT NULL,
    value character varying(100) DEFAULT ''::character varying NOT NULL
);


--
-- Name: acr_routing_variables_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.acr_routing_variables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: acr_routing_variables_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.acr_routing_variables_id_seq OWNED BY call_center.acr_routing_variables.id;


--
-- Name: cc_agent_activity; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_agent_activity (
    id integer NOT NULL,
    agent_id bigint NOT NULL,
    last_bridge_start_at bigint DEFAULT 0 NOT NULL,
    last_bridge_end_at bigint DEFAULT 0 NOT NULL,
    last_offering_call_at bigint DEFAULT 0,
    calls_abandoned integer DEFAULT 0 NOT NULL,
    calls_answered integer DEFAULT 0 NOT NULL,
    sum_talking_of_day bigint DEFAULT 0 NOT NULL,
    sum_pause_of_day bigint DEFAULT 0 NOT NULL,
    successively_no_answers smallint DEFAULT 0 NOT NULL,
    last_answer_at bigint DEFAULT 0 NOT NULL,
    sum_idle_of_day bigint DEFAULT 0 NOT NULL
);


--
-- Name: agent_statistic_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.agent_statistic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: agent_statistic_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.agent_statistic_id_seq OWNED BY call_center.cc_agent_activity.id;


--
-- Name: cc_agent; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_agent (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL,
    destination character varying(50) DEFAULT 'error/USER_BUSY'::character varying NOT NULL,
    status character varying(20) DEFAULT 'offline'::character varying NOT NULL,
    status_payload jsonb,
    state character varying(20) DEFAULT 'waiting'::character varying NOT NULL,
    state_timeout timestamp without time zone,
    description character varying(250) DEFAULT ''::character varying NOT NULL,
    domain_id bigint NOT NULL
);


--
-- Name: cc_agent_in_queue; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_agent_in_queue (
    id integer NOT NULL,
    agent_id integer,
    queue_id integer NOT NULL,
    skill_id integer,
    lvl smallint DEFAULT 0 NOT NULL
);


--
-- Name: cc_skill; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_skill (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    domain_id bigint NOT NULL,
    description character varying(100) DEFAULT ''::character varying NOT NULL
);


--
-- Name: cc_skill_in_agent; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_skill_in_agent (
    id integer NOT NULL,
    skill_id integer NOT NULL,
    agent_id integer NOT NULL,
    capacity smallint DEFAULT 0 NOT NULL,
    created_at bigint NOT NULL,
    created_by bigint NOT NULL,
    updated_at bigint NOT NULL,
    updated_by bigint NOT NULL
);


--
-- Name: available_agent_in_queue; Type: VIEW; Schema: call_center; Owner: -
--

CREATE VIEW call_center.available_agent_in_queue AS
 SELECT ag.queue_id,
    ag.agent_id,
    ag.max_of_capacity,
    ag.max_of_lvl,
    a.updated_at,
    round(((100.0 * ((ag.max_of_capacity + 1))::numeric) / (NULLIF(sum((ag.max_of_capacity + 1)) OVER (PARTITION BY ag.agent_id), 0))::numeric)) AS ratio
   FROM (( SELECT DISTINCT aq.queue_id,
            COALESCE(aq.agent_id, csia.agent_id) AS agent_id,
            COALESCE((max(csia.capacity))::integer, 0) AS max_of_capacity,
            max(aq.lvl) AS max_of_lvl
           FROM ((call_center.cc_agent_in_queue aq
             LEFT JOIN call_center.cc_skill cs ON ((aq.skill_id = cs.id)))
             LEFT JOIN call_center.cc_skill_in_agent csia ON ((cs.id = csia.skill_id)))
          WHERE (NOT (COALESCE(aq.agent_id, csia.agent_id) IS NULL))
          GROUP BY aq.queue_id, COALESCE(aq.agent_id, csia.agent_id)) ag
     JOIN call_center.cc_agent a ON ((a.id = ag.agent_id)))
  WHERE ((a.status)::text = 'online'::text);


--
-- Name: calendar_accept_of_day; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.calendar_accept_of_day (
    id integer NOT NULL,
    calendar_id integer NOT NULL,
    week_day smallint NOT NULL,
    start_time_of_day smallint DEFAULT 0 NOT NULL,
    end_time_of_day smallint DEFAULT 1440 NOT NULL
);


--
-- Name: calendar_accept_of_day_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.calendar_accept_of_day_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: calendar_accept_of_day_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.calendar_accept_of_day_id_seq OWNED BY call_center.calendar_accept_of_day.id;


--
-- Name: calendar_acl; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.calendar_acl (
    dc bigint NOT NULL,
    object bigint NOT NULL,
    grantor bigint NOT NULL,
    subject bigint NOT NULL,
    access smallint DEFAULT 0 NOT NULL
);


--
-- Name: calendar_except; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.calendar_except (
    id integer NOT NULL,
    calendar_id integer NOT NULL,
    date integer NOT NULL,
    repeat smallint
);


--
-- Name: calendar_except_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.calendar_except_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: calendar_except_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.calendar_except_id_seq OWNED BY call_center.calendar_except.id;


--
-- Name: calendar_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.calendar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: calendar_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.calendar_id_seq OWNED BY call_center.calendar.id;


--
-- Name: calendar_timezones; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.calendar_timezones (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    utc_offset interval NOT NULL
);


--
-- Name: calendar_timezones_by_interval; Type: MATERIALIZED VIEW; Schema: call_center; Owner: -
--

CREATE MATERIALIZED VIEW call_center.calendar_timezones_by_interval AS
 SELECT DISTINCT ON (calendar_timezones.utc_offset) calendar_timezones.utc_offset,
    array_agg(calendar_timezones.name) AS names
   FROM call_center.calendar_timezones
  GROUP BY calendar_timezones.utc_offset
  WITH NO DATA;


--
-- Name: calendar_timezones_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.calendar_timezones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: calendar_timezones_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.calendar_timezones_id_seq OWNED BY call_center.calendar_timezones.id;


--
-- Name: cc_agent_acl; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_agent_acl (
    id bigint NOT NULL,
    dc bigint NOT NULL,
    grantor bigint NOT NULL,
    object bigint NOT NULL,
    subject bigint NOT NULL,
    access smallint DEFAULT 0 NOT NULL
);


--
-- Name: cc_agent_acl_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_agent_acl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_agent_acl_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_agent_acl_id_seq OWNED BY call_center.cc_agent_acl.id;


--
-- Name: cc_agent_attempt; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_agent_attempt (
    id bigint NOT NULL,
    queue_id bigint NOT NULL,
    agent_id bigint,
    attempt_id bigint NOT NULL
);


--
-- Name: cc_agent_attempt_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_agent_attempt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_agent_attempt_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_agent_attempt_id_seq OWNED BY call_center.cc_agent_attempt.id;


--
-- Name: cc_agent_state_history; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_agent_state_history (
    id bigint NOT NULL,
    agent_id bigint NOT NULL,
    joined_at timestamp without time zone DEFAULT now() NOT NULL,
    state character varying(20) NOT NULL,
    timeout_at timestamp without time zone,
    payload jsonb
);


--
-- Name: cc_agent_history_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_agent_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_agent_history_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_agent_history_id_seq OWNED BY call_center.cc_agent_state_history.id;


--
-- Name: cc_agent_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_agent_id_seq OWNED BY call_center.cc_agent.id;


--
-- Name: cc_agent_in_queue_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_agent_in_queue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_agent_in_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_agent_in_queue_id_seq OWNED BY call_center.cc_agent_in_queue.id;


--
-- Name: cc_agent_in_team; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_agent_in_team (
    id bigint NOT NULL,
    team_id bigint NOT NULL,
    agent_id bigint,
    skill_id integer,
    lvl integer DEFAULT 0 NOT NULL,
    min_capacity smallint DEFAULT 0 NOT NULL,
    max_capacity smallint DEFAULT 100 NOT NULL
);


--
-- Name: cc_agent_in_team_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_agent_in_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_agent_in_team_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_agent_in_team_id_seq OWNED BY call_center.cc_agent_in_team.id;


--
-- Name: cc_list; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_list (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    description character varying(20),
    domain_id bigint NOT NULL
);


--
-- Name: cc_call_list_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_call_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_call_list_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_call_list_id_seq OWNED BY call_center.cc_list.id;


--
-- Name: cc_calls; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_calls (
    id bigint NOT NULL
);


--
-- Name: cc_calls_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_calls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_calls_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_calls_id_seq OWNED BY call_center.cc_calls.id;


--
-- Name: cc_cluster; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_cluster (
    id bigint NOT NULL,
    node_name character varying(20) NOT NULL,
    updated_at bigint NOT NULL,
    master boolean NOT NULL,
    started_at bigint DEFAULT 0 NOT NULL
);


--
-- Name: cc_cluster_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_cluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_cluster_id_seq OWNED BY call_center.cc_cluster.id;


--
-- Name: cc_communication; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_communication (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    code character varying(10) NOT NULL,
    type character varying(5),
    domain_id bigint
);


--
-- Name: cc_communication_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_communication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_communication_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_communication_id_seq OWNED BY call_center.cc_communication.id;


--
-- Name: cc_list_communications; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_list_communications (
    list_id bigint NOT NULL,
    number character varying(25) NOT NULL,
    id bigint NOT NULL
);


--
-- Name: cc_list_communications_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_list_communications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_list_communications_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_list_communications_id_seq OWNED BY call_center.cc_list_communications.id;


--
-- Name: cc_member; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_member (
    id integer NOT NULL,
    queue_id integer NOT NULL,
    priority smallint DEFAULT 0 NOT NULL,
    expire_at integer,
    variables jsonb DEFAULT '{}'::jsonb,
    name character varying(50) DEFAULT ''::character varying NOT NULL,
    stop_cause character varying(50),
    stop_at bigint DEFAULT 0 NOT NULL,
    last_hangup_at bigint DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    timezone character varying(50) NOT NULL,
    agent_id bigint,
    "offset" interval NOT NULL
);


--
-- Name: cc_member_attempt; Type: TABLE; Schema: call_center; Owner: -
--

CREATE UNLOGGED TABLE call_center.cc_member_attempt (
    id bigint NOT NULL,
    communication_id bigint NOT NULL,
    timing_id integer,
    queue_id integer NOT NULL,
    state integer DEFAULT 0 NOT NULL,
    member_id bigint NOT NULL,
    created_at bigint DEFAULT ((date_part('epoch'::text, now()) * (1000)::double precision))::bigint NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    hangup_at bigint DEFAULT 0 NOT NULL,
    bridged_at bigint DEFAULT 0 NOT NULL,
    resource_id integer,
    leg_a_id character varying(36),
    leg_b_id character varying(36),
    node_id character varying(20),
    result character varying(200),
    originate_at bigint DEFAULT 0 NOT NULL,
    answered_at bigint DEFAULT 0 NOT NULL,
    routing_id integer,
    logs jsonb,
    agent_id bigint,
    success boolean DEFAULT false NOT NULL
)
WITH (fillfactor='20', log_autovacuum_min_duration='0', autovacuum_vacuum_scale_factor='0.01', autovacuum_analyze_scale_factor='0.05', autovacuum_enabled='1', autovacuum_vacuum_cost_delay='20');


--
-- Name: TABLE cc_member_attempt; Type: COMMENT; Schema: call_center; Owner: -
--

COMMENT ON TABLE call_center.cc_member_attempt IS 'todo';


--
-- Name: cc_member_attempt_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_member_attempt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_member_attempt_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_member_attempt_id_seq OWNED BY call_center.cc_member_attempt.id;


--
-- Name: cc_member_attempt_log; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_member_attempt_log (
    id bigint DEFAULT nextval('call_center.cc_member_attempt_id_seq'::regclass) NOT NULL,
    communication_id bigint NOT NULL,
    timing_id integer,
    queue_id bigint NOT NULL,
    state integer DEFAULT 0 NOT NULL,
    member_id bigint NOT NULL,
    created_at bigint DEFAULT ((date_part('epoch'::text, now()) * (1000)::double precision))::bigint NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    hangup_at bigint DEFAULT 0 NOT NULL,
    bridged_at bigint DEFAULT 0 NOT NULL,
    resource_id integer,
    leg_a_id character varying(36),
    leg_b_id character varying(36),
    node_id character varying(20),
    result character varying(200),
    originate_at bigint DEFAULT 0 NOT NULL,
    answered_at bigint DEFAULT 0 NOT NULL,
    routing_id integer,
    logs jsonb,
    agent_id bigint
);


--
-- Name: cc_member_communications_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_member_communications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_member_communications_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_member_communications_id_seq OWNED BY call_center.cc_member_communications.id;


SET default_with_oids = true;

--
-- Name: cc_member_communications_old; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_member_communications_old (
    id integer DEFAULT nextval('call_center.cc_member_communications_id_seq'::regclass) NOT NULL,
    member_id integer NOT NULL,
    priority smallint DEFAULT 0 NOT NULL,
    number character varying(20) NOT NULL,
    last_originate_at bigint DEFAULT 0 NOT NULL,
    state smallint DEFAULT 0 NOT NULL,
    communication_id integer,
    routing_ids integer[],
    description character varying(100) DEFAULT ''::character varying,
    last_hangup_at bigint DEFAULT 0 NOT NULL,
    attempts bigint DEFAULT 0 NOT NULL,
    last_hangup_cause character varying(50) DEFAULT ''::character varying NOT NULL
);


--
-- Name: cc_member_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_member_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_member_id_seq OWNED BY call_center.cc_member.id;


SET default_with_oids = false;

--
-- Name: cc_member_messages; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_member_messages (
    id bigint NOT NULL,
    member_id bigint NOT NULL,
    communication_id bigint NOT NULL,
    state integer DEFAULT 0 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    message bytea
);


--
-- Name: cc_member_messages_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_member_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_member_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_member_messages_id_seq OWNED BY call_center.cc_member_messages.id;


--
-- Name: cc_queue; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_queue (
    id integer NOT NULL,
    strategy character varying(20) NOT NULL,
    enabled boolean NOT NULL,
    payload jsonb NOT NULL,
    calendar_id integer NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    max_calls integer DEFAULT 0 NOT NULL,
    sec_between_retries integer DEFAULT 10 NOT NULL,
    updated_at bigint DEFAULT ((date_part('epoch'::text, now()) * (1000)::double precision))::bigint NOT NULL,
    name character varying(50),
    max_of_retry smallint DEFAULT 0 NOT NULL,
    variables jsonb DEFAULT '{}'::jsonb NOT NULL,
    timeout integer DEFAULT 60 NOT NULL,
    domain_id bigint NOT NULL,
    dnc_list_id bigint,
    sec_locate_agent integer DEFAULT 5 NOT NULL,
    type smallint DEFAULT 1 NOT NULL,
    team_id bigint
);


--
-- Name: cc_queue_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_queue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_queue_id_seq OWNED BY call_center.cc_queue.id;


--
-- Name: cc_queue_is_working; Type: VIEW; Schema: call_center; Owner: -
--

CREATE VIEW call_center.cc_queue_is_working AS
 SELECT c1.id,
    c1.strategy,
    c1.enabled,
    c1.payload,
    c1.calendar_id,
    c1.priority,
    c1.max_calls,
    c1.sec_between_retries,
    c1.updated_at,
    c1.name,
    c1.max_of_retry,
    c1.variables,
    c1.timeout,
    c1.domain_id,
    c1.dnc_list_id,
    c1.sec_locate_agent,
    c1.type,
        CASE
            WHEN ((c1.max_calls - tmp.active_calls) <= 0) THEN 0
            ELSE (c1.max_calls - tmp.active_calls)
        END AS need_call,
    a.a AS available_agents
   FROM call_center.cc_queue c1,
    (LATERAL ( SELECT call_center.get_count_call(c1.id) AS active_calls) tmp(active_calls)
     LEFT JOIN LATERAL ( SELECT call_center.get_agents_available_count_by_queue_id(c1.id) AS a
          WHERE (c1.type <> 1)) a ON (true))
  WHERE (c1.enabled = true);


--
-- Name: cc_queue_resource_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_queue_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_queue_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_queue_resource_id_seq OWNED BY call_center.cc_outbound_resource.id;


--
-- Name: cc_queue_resources_is_working; Type: VIEW; Schema: call_center; Owner: -
--

CREATE VIEW call_center.cc_queue_resources_is_working AS
 SELECT r.id,
    r."limit" AS max_call_count,
    r.enabled,
    call_center.get_count_active_resources(r.id) AS reserved_count
   FROM call_center.cc_outbound_resource r
  WHERE ((r.enabled IS TRUE) AND (NOT (r.reserve IS TRUE)));


--
-- Name: cc_queue_routing; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_queue_routing (
    id integer NOT NULL,
    queue_id integer NOT NULL,
    pattern character varying(50) NOT NULL,
    priority integer DEFAULT 0 NOT NULL
);


--
-- Name: cc_queue_routing_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_queue_routing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_queue_routing_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_queue_routing_id_seq OWNED BY call_center.cc_queue_routing.id;


--
-- Name: cc_queue_timing; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_queue_timing (
    id integer NOT NULL,
    queue_id integer NOT NULL,
    communication_id integer NOT NULL,
    priority smallint DEFAULT 0 NOT NULL,
    start_time_of_day smallint DEFAULT 0 NOT NULL,
    end_time_of_day smallint DEFAULT 1439 NOT NULL,
    max_attempt smallint DEFAULT 0 NOT NULL,
    enabled boolean DEFAULT true
);


--
-- Name: cc_queue_timing_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_queue_timing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_queue_timing_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_queue_timing_id_seq OWNED BY call_center.cc_queue_timing.id;


--
-- Name: cc_resource_in_routing; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_resource_in_routing (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    priority smallint DEFAULT 0 NOT NULL,
    routing_id integer NOT NULL,
    capacity integer DEFAULT 0
);


--
-- Name: cc_resource_in_queue_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_resource_in_queue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_resource_in_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_resource_in_queue_id_seq OWNED BY call_center.cc_resource_in_routing.id;


--
-- Name: cc_skill_in_agent_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_skill_in_agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_skill_in_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_skill_in_agent_id_seq OWNED BY call_center.cc_skill_in_agent.id;


--
-- Name: cc_skils_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_skils_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_skils_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_skils_id_seq OWNED BY call_center.cc_skill.id;


--
-- Name: cc_supervisor_in_team; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_supervisor_in_team (
    id bigint NOT NULL,
    agent_id bigint NOT NULL,
    team_id bigint NOT NULL
);


--
-- Name: cc_supervisor_in_team_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_supervisor_in_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_supervisor_in_team_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_supervisor_in_team_id_seq OWNED BY call_center.cc_supervisor_in_team.id;


--
-- Name: cc_team; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_team (
    id bigint NOT NULL,
    domain_id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(500) DEFAULT ''::character varying NOT NULL,
    strategy character varying(20) NOT NULL,
    max_no_answer smallint DEFAULT 0 NOT NULL,
    wrap_up_time smallint DEFAULT 0 NOT NULL,
    reject_delay_time smallint DEFAULT 0 NOT NULL,
    busy_delay_time smallint DEFAULT 0 NOT NULL,
    no_answer_delay_time smallint DEFAULT 0 NOT NULL,
    call_timeout smallint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL
);


--
-- Name: cc_team_acl; Type: TABLE; Schema: call_center; Owner: -
--

CREATE TABLE call_center.cc_team_acl (
    id bigint NOT NULL,
    dc bigint NOT NULL,
    grantor bigint NOT NULL,
    subject bigint NOT NULL,
    access smallint DEFAULT 0 NOT NULL,
    object bigint NOT NULL
);


--
-- Name: cc_team_acl_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_team_acl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_team_acl_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_team_acl_id_seq OWNED BY call_center.cc_team_acl.id;


--
-- Name: cc_team_id_seq; Type: SEQUENCE; Schema: call_center; Owner: -
--

CREATE SEQUENCE call_center.cc_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cc_team_id_seq; Type: SEQUENCE OWNED BY; Schema: call_center; Owner: -
--

ALTER SEQUENCE call_center.cc_team_id_seq OWNED BY call_center.cc_team.id;


--
-- Name: members_in_queue; Type: VIEW; Schema: call_center; Owner: -
--

CREATE VIEW call_center.members_in_queue AS
 SELECT cc_member.id,
    cc_member.queue_id,
    cc_member.priority,
    cc_member.expire_at
   FROM call_center.cc_member
  WITH LOCAL CHECK OPTION;


--
-- Name: acr_routing_inbound_call id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_inbound_call ALTER COLUMN id SET DEFAULT nextval('call_center.acr_routing_inbound_call_id_seq'::regclass);


--
-- Name: acr_routing_outbound_call id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_outbound_call ALTER COLUMN id SET DEFAULT nextval('call_center.acr_routing_outbound_call_id_seq'::regclass);


--
-- Name: acr_routing_scheme id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_scheme ALTER COLUMN id SET DEFAULT nextval('call_center.acr_routing_scheme_id_seq'::regclass);


--
-- Name: acr_routing_variables id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_variables ALTER COLUMN id SET DEFAULT nextval('call_center.acr_routing_variables_id_seq'::regclass);


--
-- Name: calendar id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar ALTER COLUMN id SET DEFAULT nextval('call_center.calendar_id_seq'::regclass);


--
-- Name: calendar_accept_of_day id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar_accept_of_day ALTER COLUMN id SET DEFAULT nextval('call_center.calendar_accept_of_day_id_seq'::regclass);


--
-- Name: calendar_except id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar_except ALTER COLUMN id SET DEFAULT nextval('call_center.calendar_except_id_seq'::regclass);


--
-- Name: calendar_timezones id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar_timezones ALTER COLUMN id SET DEFAULT nextval('call_center.calendar_timezones_id_seq'::regclass);


--
-- Name: cc_agent id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent ALTER COLUMN id SET DEFAULT nextval('call_center.cc_agent_id_seq'::regclass);


--
-- Name: cc_agent_acl id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_acl ALTER COLUMN id SET DEFAULT nextval('call_center.cc_agent_acl_id_seq'::regclass);


--
-- Name: cc_agent_activity id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_activity ALTER COLUMN id SET DEFAULT nextval('call_center.agent_statistic_id_seq'::regclass);


--
-- Name: cc_agent_attempt id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_attempt ALTER COLUMN id SET DEFAULT nextval('call_center.cc_agent_attempt_id_seq'::regclass);


--
-- Name: cc_agent_in_queue id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_in_queue ALTER COLUMN id SET DEFAULT nextval('call_center.cc_agent_in_queue_id_seq'::regclass);


--
-- Name: cc_agent_in_team id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_in_team ALTER COLUMN id SET DEFAULT nextval('call_center.cc_agent_in_team_id_seq'::regclass);


--
-- Name: cc_agent_state_history id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_state_history ALTER COLUMN id SET DEFAULT nextval('call_center.cc_agent_history_id_seq'::regclass);


--
-- Name: cc_calls id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_calls ALTER COLUMN id SET DEFAULT nextval('call_center.cc_calls_id_seq'::regclass);


--
-- Name: cc_cluster id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_cluster ALTER COLUMN id SET DEFAULT nextval('call_center.cc_cluster_id_seq'::regclass);


--
-- Name: cc_communication id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_communication ALTER COLUMN id SET DEFAULT nextval('call_center.cc_communication_id_seq'::regclass);


--
-- Name: cc_list id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_list ALTER COLUMN id SET DEFAULT nextval('call_center.cc_call_list_id_seq'::regclass);


--
-- Name: cc_list_communications id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_list_communications ALTER COLUMN id SET DEFAULT nextval('call_center.cc_list_communications_id_seq'::regclass);


--
-- Name: cc_member id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member ALTER COLUMN id SET DEFAULT nextval('call_center.cc_member_id_seq'::regclass);


--
-- Name: cc_member_attempt id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_attempt ALTER COLUMN id SET DEFAULT nextval('call_center.cc_member_attempt_id_seq'::regclass);


--
-- Name: cc_member_communications id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_communications ALTER COLUMN id SET DEFAULT nextval('call_center.cc_member_communications_id_seq'::regclass);


--
-- Name: cc_member_messages id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_messages ALTER COLUMN id SET DEFAULT nextval('call_center.cc_member_messages_id_seq'::regclass);


--
-- Name: cc_outbound_resource id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_outbound_resource ALTER COLUMN id SET DEFAULT nextval('call_center.cc_queue_resource_id_seq'::regclass);


--
-- Name: cc_queue id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue ALTER COLUMN id SET DEFAULT nextval('call_center.cc_queue_id_seq'::regclass);


--
-- Name: cc_queue_routing id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue_routing ALTER COLUMN id SET DEFAULT nextval('call_center.cc_queue_routing_id_seq'::regclass);


--
-- Name: cc_queue_timing id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue_timing ALTER COLUMN id SET DEFAULT nextval('call_center.cc_queue_timing_id_seq'::regclass);


--
-- Name: cc_resource_in_routing id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_resource_in_routing ALTER COLUMN id SET DEFAULT nextval('call_center.cc_resource_in_queue_id_seq'::regclass);


--
-- Name: cc_skill id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_skill ALTER COLUMN id SET DEFAULT nextval('call_center.cc_skils_id_seq'::regclass);


--
-- Name: cc_skill_in_agent id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_skill_in_agent ALTER COLUMN id SET DEFAULT nextval('call_center.cc_skill_in_agent_id_seq'::regclass);


--
-- Name: cc_supervisor_in_team id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_supervisor_in_team ALTER COLUMN id SET DEFAULT nextval('call_center.cc_supervisor_in_team_id_seq'::regclass);


--
-- Name: cc_team id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_team ALTER COLUMN id SET DEFAULT nextval('call_center.cc_team_id_seq'::regclass);


--
-- Name: cc_team_acl id; Type: DEFAULT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_team_acl ALTER COLUMN id SET DEFAULT nextval('call_center.cc_team_acl_id_seq'::regclass);


--
-- Name: acr_routing_inbound_call acr_routing_inbound_call_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_inbound_call
    ADD CONSTRAINT acr_routing_inbound_call_pk PRIMARY KEY (id);


--
-- Name: acr_routing_outbound_call acr_routing_outbound_call_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_outbound_call
    ADD CONSTRAINT acr_routing_outbound_call_pk PRIMARY KEY (id);


--
-- Name: acr_routing_scheme acr_routing_scheme_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_scheme
    ADD CONSTRAINT acr_routing_scheme_pk PRIMARY KEY (id);


--
-- Name: acr_routing_variables acr_routing_variables_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_variables
    ADD CONSTRAINT acr_routing_variables_pk PRIMARY KEY (id);


--
-- Name: cc_agent_activity agent_statistic_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_activity
    ADD CONSTRAINT agent_statistic_pk PRIMARY KEY (id);


--
-- Name: calendar_accept_of_day calendar_accept_of_day_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar_accept_of_day
    ADD CONSTRAINT calendar_accept_of_day_pkey PRIMARY KEY (id);


--
-- Name: calendar_except calendar_except_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar_except
    ADD CONSTRAINT calendar_except_pkey PRIMARY KEY (id);


--
-- Name: calendar calendar_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar
    ADD CONSTRAINT calendar_pkey PRIMARY KEY (id);


--
-- Name: calendar_timezones calendar_timezones_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar_timezones
    ADD CONSTRAINT calendar_timezones_pk PRIMARY KEY (name);


--
-- Name: cc_agent_acl cc_agent_acl_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_acl
    ADD CONSTRAINT cc_agent_acl_pk PRIMARY KEY (id);


--
-- Name: cc_agent_attempt cc_agent_attempt_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_attempt
    ADD CONSTRAINT cc_agent_attempt_pk PRIMARY KEY (id);


--
-- Name: cc_agent_in_queue cc_agent_in_queue_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_in_queue
    ADD CONSTRAINT cc_agent_in_queue_pkey PRIMARY KEY (id);


--
-- Name: cc_agent_in_team cc_agent_in_team_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_in_team
    ADD CONSTRAINT cc_agent_in_team_pk PRIMARY KEY (id);


--
-- Name: cc_agent cc_agent_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent
    ADD CONSTRAINT cc_agent_pkey PRIMARY KEY (id);


--
-- Name: cc_agent_state_history cc_agent_status_history_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_state_history
    ADD CONSTRAINT cc_agent_status_history_pk PRIMARY KEY (id);


--
-- Name: cc_list cc_call_list_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_list
    ADD CONSTRAINT cc_call_list_pk PRIMARY KEY (id);


--
-- Name: cc_calls cc_calls_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_calls
    ADD CONSTRAINT cc_calls_pk PRIMARY KEY (id);


--
-- Name: cc_cluster cc_cluster_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_cluster
    ADD CONSTRAINT cc_cluster_pkey PRIMARY KEY (id);


--
-- Name: cc_communication cc_communication_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_communication
    ADD CONSTRAINT cc_communication_pkey PRIMARY KEY (id);


--
-- Name: cc_list_communications cc_list_communications_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_list_communications
    ADD CONSTRAINT cc_list_communications_pk PRIMARY KEY (id);


--
-- Name: cc_member_attempt_log cc_member_attempt_log_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_attempt_log
    ADD CONSTRAINT cc_member_attempt_log_pkey PRIMARY KEY (id);


--
-- Name: cc_member_attempt cc_member_attempt_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_attempt
    ADD CONSTRAINT cc_member_attempt_pk PRIMARY KEY (id);


--
-- Name: cc_member_communications cc_member_communications_id_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_communications
    ADD CONSTRAINT cc_member_communications_id_pk PRIMARY KEY (id);


--
-- Name: cc_member_communications_old cc_member_communications_old_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_communications_old
    ADD CONSTRAINT cc_member_communications_old_pkey PRIMARY KEY (id);


--
-- Name: cc_member_messages cc_member_messages_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_messages
    ADD CONSTRAINT cc_member_messages_pk PRIMARY KEY (id);


--
-- Name: cc_member cc_member_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member
    ADD CONSTRAINT cc_member_pkey PRIMARY KEY (id);


--
-- Name: cc_queue cc_queue_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue
    ADD CONSTRAINT cc_queue_pkey PRIMARY KEY (id);


--
-- Name: cc_outbound_resource cc_queue_resource_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_outbound_resource
    ADD CONSTRAINT cc_queue_resource_pkey PRIMARY KEY (id);


--
-- Name: cc_queue_routing cc_queue_routing_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue_routing
    ADD CONSTRAINT cc_queue_routing_pkey PRIMARY KEY (id);


--
-- Name: cc_queue_timing cc_queue_timing_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue_timing
    ADD CONSTRAINT cc_queue_timing_pkey PRIMARY KEY (id);


--
-- Name: cc_resource_in_routing cc_resource_in_queue_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_resource_in_routing
    ADD CONSTRAINT cc_resource_in_queue_pkey PRIMARY KEY (id);


--
-- Name: cc_skill_in_agent cc_skill_in_agent_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_skill_in_agent
    ADD CONSTRAINT cc_skill_in_agent_pkey PRIMARY KEY (id);


--
-- Name: cc_skill cc_skils_pkey; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_skill
    ADD CONSTRAINT cc_skils_pkey PRIMARY KEY (id);


--
-- Name: cc_supervisor_in_team cc_supervisor_in_team_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_supervisor_in_team
    ADD CONSTRAINT cc_supervisor_in_team_pk PRIMARY KEY (id);


--
-- Name: cc_team_acl cc_team_acl_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_team_acl
    ADD CONSTRAINT cc_team_acl_pk PRIMARY KEY (id);


--
-- Name: cc_team cc_team_pk; Type: CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_team
    ADD CONSTRAINT cc_team_pk PRIMARY KEY (id);


--
-- Name: acr_routing_inbound_call_domain_id_numbers_host_disabled_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX acr_routing_inbound_call_domain_id_numbers_host_disabled_index ON call_center.acr_routing_inbound_call USING btree (domain_id, numbers, host, disabled);


--
-- Name: acr_routing_inbound_call_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX acr_routing_inbound_call_id_uindex ON call_center.acr_routing_inbound_call USING btree (id);


--
-- Name: acr_routing_outbound_call_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX acr_routing_outbound_call_id_uindex ON call_center.acr_routing_outbound_call USING btree (id);


--
-- Name: acr_routing_scheme_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX acr_routing_scheme_id_uindex ON call_center.acr_routing_scheme USING btree (id);


--
-- Name: acr_routing_variables_domain_id_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX acr_routing_variables_domain_id_index ON call_center.acr_routing_variables USING btree (domain_id);


--
-- Name: acr_routing_variables_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX acr_routing_variables_id_uindex ON call_center.acr_routing_variables USING btree (id);


--
-- Name: agent_statistic_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX agent_statistic_id_uindex ON call_center.cc_agent_activity USING btree (id);


--
-- Name: calendar_accept_of_day_calendar_id_week_day_start_time_of_day_e; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX calendar_accept_of_day_calendar_id_week_day_start_time_of_day_e ON call_center.calendar_accept_of_day USING btree (calendar_id, week_day, start_time_of_day, end_time_of_day DESC);


--
-- Name: calendar_accept_of_day_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX calendar_accept_of_day_id_uindex ON call_center.calendar_accept_of_day USING btree (id);


--
-- Name: calendar_domain_id_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX calendar_domain_id_index ON call_center.calendar USING btree (domain_id);


--
-- Name: calendar_except_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX calendar_except_id_uindex ON call_center.calendar_except USING btree (id);


--
-- Name: calendar_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX calendar_id_uindex ON call_center.calendar USING btree (id);


--
-- Name: calendar_timezones_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX calendar_timezones_id_uindex ON call_center.calendar_timezones USING btree (id);


--
-- Name: calendar_timezones_name_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX calendar_timezones_name_uindex ON call_center.calendar_timezones USING btree (name);


--
-- Name: calendar_timezones_utc_offset_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX calendar_timezones_utc_offset_index ON call_center.calendar_timezones USING btree (id, utc_offset, name);


--
-- Name: cc_agent_acl_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_agent_acl_id_uindex ON call_center.cc_agent_acl USING btree (id);


--
-- Name: cc_agent_activity_agent_id_last_offering_call_at_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_agent_activity_agent_id_last_offering_call_at_uindex ON call_center.cc_agent_activity USING btree (agent_id, last_offering_call_at);


--
-- Name: cc_agent_attempt_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_agent_attempt_id_uindex ON call_center.cc_agent_attempt USING btree (id);


--
-- Name: cc_agent_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_agent_id_uindex ON call_center.cc_agent USING btree (id);


--
-- Name: cc_agent_in_queue_agent_id_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_agent_in_queue_agent_id_index ON call_center.cc_agent_in_queue USING btree (agent_id);


--
-- Name: cc_agent_in_queue_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_agent_in_queue_id_uindex ON call_center.cc_agent_in_queue USING btree (id);


--
-- Name: cc_agent_in_queue_queue_id_agent_id_skill_id_lvl_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_agent_in_queue_queue_id_agent_id_skill_id_lvl_uindex ON call_center.cc_agent_in_queue USING btree (queue_id, agent_id, skill_id, lvl DESC);


--
-- Name: cc_agent_in_queue_queue_id_lvl_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_agent_in_queue_queue_id_lvl_index ON call_center.cc_agent_in_queue USING btree (queue_id, lvl DESC);


--
-- Name: cc_agent_in_queue_skill_id_queue_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_agent_in_queue_skill_id_queue_id_uindex ON call_center.cc_agent_in_queue USING btree (skill_id, queue_id);


--
-- Name: cc_agent_in_team_agent_id_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_agent_in_team_agent_id_index ON call_center.cc_agent_in_team USING btree (agent_id);


--
-- Name: cc_agent_in_team_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_agent_in_team_id_uindex ON call_center.cc_agent_in_team USING btree (id);


--
-- Name: cc_agent_in_team_skill_id_team_id_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_agent_in_team_skill_id_team_id_index ON call_center.cc_agent_in_team USING btree (skill_id, team_id);


--
-- Name: cc_agent_in_team_team_id_agent_id_skill_id_lvl_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_agent_in_team_team_id_agent_id_skill_id_lvl_uindex ON call_center.cc_agent_in_team USING btree (team_id, agent_id, skill_id, lvl DESC);


--
-- Name: cc_agent_in_team_team_id_lvl_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_agent_in_team_team_id_lvl_index ON call_center.cc_agent_in_team USING btree (team_id, lvl DESC);


--
-- Name: cc_agent_state_history_agent_id_joined_at_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_agent_state_history_agent_id_joined_at_uindex ON call_center.cc_agent_state_history USING btree (agent_id, joined_at DESC);


--
-- Name: cc_agent_state_timeout_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_agent_state_timeout_index ON call_center.cc_agent USING btree (state_timeout);


--
-- Name: cc_agent_status_history_agent_id_join_at_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_agent_status_history_agent_id_join_at_index ON call_center.cc_agent_state_history USING btree (joined_at DESC, agent_id, state);


--
-- Name: cc_agent_status_history_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_agent_status_history_id_uindex ON call_center.cc_agent_state_history USING btree (id);


--
-- Name: cc_agent_status_state_id_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_agent_status_state_id_index ON call_center.cc_agent USING btree (status, state, id);


--
-- Name: cc_call_list_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_call_list_id_uindex ON call_center.cc_list USING btree (id);


--
-- Name: cc_calls_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_calls_id_uindex ON call_center.cc_calls USING btree (id);


--
-- Name: cc_cluster_node_name_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_cluster_node_name_uindex ON call_center.cc_cluster USING btree (node_name);


--
-- Name: cc_communication_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_communication_id_uindex ON call_center.cc_communication USING btree (id);


--
-- Name: cc_list_communications_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_list_communications_id_uindex ON call_center.cc_list_communications USING btree (id);


--
-- Name: cc_list_communications_list_id_number_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_list_communications_list_id_number_uindex ON call_center.cc_list_communications USING btree (list_id, number);


--
-- Name: cc_member_agent_id_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_agent_id_index ON call_center.cc_member USING btree (agent_id);


--
-- Name: cc_member_attempt_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_member_attempt_id_uindex ON call_center.cc_member_attempt USING btree (id);


--
-- Name: cc_member_attempt_log_created_at_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_attempt_log_created_at_index ON call_center.cc_member_attempt_log USING btree (created_at DESC);


--
-- Name: cc_member_attempt_log_hangup_at_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_attempt_log_hangup_at_index ON call_center.cc_member_attempt_log USING btree (hangup_at DESC);


--
-- Name: cc_member_attempt_log_queue_id_idx; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_attempt_log_queue_id_idx ON call_center.cc_member_attempt_log USING btree (queue_id);


--
-- Name: cc_member_communications_member_id_communication_id_routing_ids; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_communications_member_id_communication_id_routing_ids ON call_center.cc_member_communications USING gin (routing_ids gin__int_ops, communication_id, member_id) WHERE (state = 0);


--
-- Name: cc_member_communications_member_id_communication_test_1; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_communications_member_id_communication_test_1 ON call_center.cc_member_communications USING btree (member_id) INCLUDE (id, routing_ids, number, last_hangup_at, priority, communication_id) WHERE (state = 0);


--
-- Name: cc_member_communications_number_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_communications_number_index ON call_center.cc_member_communications USING btree (number);


--
-- Name: cc_member_communications_old_communication_id_member_id_las_idx; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_communications_old_communication_id_member_id_las_idx ON call_center.cc_member_communications_old USING btree (communication_id, member_id, last_hangup_at, priority DESC) WHERE (state = 0);


--
-- Name: cc_member_communications_old_member_id_communication_id_num_idx; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_member_communications_old_member_id_communication_id_num_idx ON call_center.cc_member_communications_old USING btree (member_id, communication_id, number DESC) WHERE (state = 0);


--
-- Name: cc_member_communications_old_member_id_id_idx; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_member_communications_old_member_id_id_idx ON call_center.cc_member_communications_old USING btree (member_id, id);


--
-- Name: cc_member_communications_old_member_id_routing_ids_idx; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_communications_old_member_id_routing_ids_idx ON call_center.cc_member_communications_old USING gin (member_id, routing_ids gin__int_ops) WHERE (state = 0);


--
-- Name: cc_member_communications_old_number_idx; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_communications_old_number_idx ON call_center.cc_member_communications_old USING btree (number);


--
-- Name: cc_member_id_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_id_index ON call_center.cc_member USING btree (id);


--
-- Name: cc_member_messages_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_member_messages_id_uindex ON call_center.cc_member_messages USING btree (id);


--
-- Name: cc_member_queue_id_priority_last_hangup_at_timezone_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_queue_id_priority_last_hangup_at_timezone_index ON call_center.cc_member USING btree (queue_id, priority DESC, last_hangup_at, "offset") INCLUDE (id) WHERE (stop_at = 0);


--
-- Name: cc_member_timezone_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_member_timezone_index ON call_center.cc_member USING btree (timezone);


--
-- Name: cc_queue_enabled_priority_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_queue_enabled_priority_index ON call_center.cc_queue USING btree (enabled, priority DESC);


--
-- Name: cc_queue_id_priority_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_queue_id_priority_uindex ON call_center.cc_queue USING btree (priority, sec_locate_agent, updated_at);


--
-- Name: cc_queue_resource_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_queue_resource_id_uindex ON call_center.cc_outbound_resource USING btree (id);


--
-- Name: cc_queue_routing_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_queue_routing_id_uindex ON call_center.cc_queue_routing USING btree (id);


--
-- Name: cc_queue_routing_queue_id_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_queue_routing_queue_id_index ON call_center.cc_queue_routing USING btree (queue_id);


--
-- Name: cc_queue_timing_communication_id_max_attempt_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_queue_timing_communication_id_max_attempt_index ON call_center.cc_queue_timing USING btree (communication_id, max_attempt);


--
-- Name: cc_queue_timing_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_queue_timing_id_uindex ON call_center.cc_queue_timing USING btree (id);


--
-- Name: cc_queue_timing_queue_id_communication_id_start_time_of_day_end; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_queue_timing_queue_id_communication_id_start_time_of_day_end ON call_center.cc_queue_timing USING btree (queue_id, communication_id, start_time_of_day, end_time_of_day);


--
-- Name: cc_resource_in_queue_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_resource_in_queue_id_uindex ON call_center.cc_resource_in_routing USING btree (id);


--
-- Name: cc_resource_in_routing_priority_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_resource_in_routing_priority_index ON call_center.cc_resource_in_routing USING btree (priority);


--
-- Name: cc_resource_in_routing_resource_id_routing_id_index; Type: INDEX; Schema: call_center; Owner: -
--

CREATE INDEX cc_resource_in_routing_resource_id_routing_id_index ON call_center.cc_resource_in_routing USING btree (resource_id, routing_id);


--
-- Name: cc_skill_in_agent_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_skill_in_agent_id_uindex ON call_center.cc_skill_in_agent USING btree (id);


--
-- Name: cc_skill_in_agent_skill_id_agent_id_capacity_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_skill_in_agent_skill_id_agent_id_capacity_uindex ON call_center.cc_skill_in_agent USING btree (skill_id, agent_id, capacity DESC);


--
-- Name: cc_skils_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_skils_id_uindex ON call_center.cc_skill USING btree (id);


--
-- Name: cc_supervisor_in_team_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_supervisor_in_team_id_uindex ON call_center.cc_supervisor_in_team USING btree (id);


--
-- Name: cc_team_acl_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_team_acl_id_uindex ON call_center.cc_team_acl USING btree (id);


--
-- Name: cc_team_id_uindex; Type: INDEX; Schema: call_center; Owner: -
--

CREATE UNIQUE INDEX cc_team_id_uindex ON call_center.cc_team USING btree (id);


--
-- Name: cc_member_timezone_stats; Type: STATISTICS; Schema: call_center; Owner: -
--

CREATE STATISTICS call_center.cc_member_timezone_stats (dependencies) ON queue_id, "offset" FROM call_center.cc_member;


--
-- Name: cc_queue_distribute_resources _RETURN; Type: RULE; Schema: call_center; Owner: -
--

CREATE OR REPLACE VIEW call_center.cc_queue_distribute_resources AS
 SELECT r.queue_id,
    r.resource_id,
    r.routing_ids,
    (((date_part('epoch'::text, now()) * (1000)::double precision))::bigint - (q.sec_between_retries * 1000)) AS min_activity_at,
    r.call_count,
    q.dnc_list_id,
    a.a AS times,
    q.type,
    q.strategy,
    q.payload,
    q.team_id
   FROM ((call_center.get_free_resources() r(queue_id, resource_id, routing_ids, call_count, sec_between_retries)
     JOIN call_center.cc_queue q ON ((q.id = r.queue_id)))
     CROSS JOIN LATERAL call_center.cc_queue_timing_timezones((q.id)::bigint, (q.calendar_id)::bigint) a(a))
  WHERE ((r.call_count > 0) AND (a.a IS NOT NULL))
  GROUP BY r.queue_id, a.a, r.resource_id, r.routing_ids, r.call_count, r.sec_between_retries, q.id
  ORDER BY q.priority DESC;


--
-- Name: cc_member_attempt cc_tg_transfer_attempt_to_log; Type: TRIGGER; Schema: call_center; Owner: -
--

CREATE TRIGGER cc_tg_transfer_attempt_to_log AFTER UPDATE ON call_center.cc_member_attempt FOR EACH ROW WHEN ((new.state = '-1'::integer)) EXECUTE PROCEDURE call_center.cc_transfer_attempt_to_log();


--
-- Name: cc_agent tg_cc_set_agent_change_status_u; Type: TRIGGER; Schema: call_center; Owner: -
--

CREATE TRIGGER tg_cc_set_agent_change_status_u AFTER UPDATE ON call_center.cc_agent FOR EACH ROW WHEN (((old.state)::text <> (new.state)::text)) EXECUTE PROCEDURE call_center.cc_set_agent_change_status();


--
-- Name: cc_member_communications tg_set_routing_ids_on_insert; Type: TRIGGER; Schema: call_center; Owner: -
--

CREATE TRIGGER tg_set_routing_ids_on_insert BEFORE INSERT ON call_center.cc_member_communications FOR EACH ROW WHEN (((new.number)::text <> ''::text)) EXECUTE PROCEDURE call_center.tg_get_member_communication_resource();

ALTER TABLE call_center.cc_member_communications DISABLE TRIGGER tg_set_routing_ids_on_insert;


--
-- Name: cc_queue_routing tg_set_routing_ids_on_insert_or_delete_pattern; Type: TRIGGER; Schema: call_center; Owner: -
--

CREATE TRIGGER tg_set_routing_ids_on_insert_or_delete_pattern AFTER INSERT OR DELETE ON call_center.cc_queue_routing FOR EACH ROW EXECUTE PROCEDURE call_center.tg_fill_member_communication_resource();


--
-- Name: cc_member_communications tg_set_routing_ids_on_update_number; Type: TRIGGER; Schema: call_center; Owner: -
--

CREATE TRIGGER tg_set_routing_ids_on_update_number BEFORE UPDATE ON call_center.cc_member_communications FOR EACH ROW WHEN (((new.number)::text <> (old.number)::text)) EXECUTE PROCEDURE call_center.tg_get_member_communication_resource();


--
-- Name: cc_queue_routing tg_set_routing_ids_on_update_pattern; Type: TRIGGER; Schema: call_center; Owner: -
--

CREATE TRIGGER tg_set_routing_ids_on_update_pattern AFTER UPDATE ON call_center.cc_queue_routing FOR EACH ROW WHEN ((((old.pattern)::text <> (new.pattern)::text) OR (old.id <> new.id) OR (old.queue_id <> new.queue_id))) EXECUTE PROCEDURE call_center.tg_fill_member_communication_resource();


--
-- Name: acr_routing_inbound_call acr_routing_inbound_call___fka; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_inbound_call
    ADD CONSTRAINT acr_routing_inbound_call___fka FOREIGN KEY (stop_scheme_id) REFERENCES call_center.acr_routing_scheme(id);


--
-- Name: acr_routing_inbound_call acr_routing_inbound_call_acr_routing_scheme_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_inbound_call
    ADD CONSTRAINT acr_routing_inbound_call_acr_routing_scheme_id_fk FOREIGN KEY (start_scheme_id) REFERENCES call_center.acr_routing_scheme(id);


--
-- Name: acr_routing_inbound_call acr_routing_inbound_call_calendar_timezones_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_inbound_call
    ADD CONSTRAINT acr_routing_inbound_call_calendar_timezones_id_fk FOREIGN KEY (timezone_id) REFERENCES call_center.calendar_timezones(id);


--
-- Name: acr_routing_inbound_call acr_routing_inbound_call_wbt_domain_dc_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_inbound_call
    ADD CONSTRAINT acr_routing_inbound_call_wbt_domain_dc_fk FOREIGN KEY (domain_id) REFERENCES directory.wbt_domain(dc);


--
-- Name: acr_routing_outbound_call acr_routing_outbound_call_acr_routing_scheme_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_outbound_call
    ADD CONSTRAINT acr_routing_outbound_call_acr_routing_scheme_id_fk FOREIGN KEY (scheme_id) REFERENCES call_center.acr_routing_scheme(id);


--
-- Name: acr_routing_outbound_call acr_routing_outbound_call_wbt_domain_dc_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_outbound_call
    ADD CONSTRAINT acr_routing_outbound_call_wbt_domain_dc_fk FOREIGN KEY (domain_id) REFERENCES directory.wbt_domain(dc);


--
-- Name: acr_routing_scheme acr_routing_scheme_wbt_domain_dc_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_scheme
    ADD CONSTRAINT acr_routing_scheme_wbt_domain_dc_fk FOREIGN KEY (domain_id) REFERENCES directory.wbt_domain(dc);


--
-- Name: acr_routing_variables acr_routing_variables_wbt_domain_dc_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.acr_routing_variables
    ADD CONSTRAINT acr_routing_variables_wbt_domain_dc_fk FOREIGN KEY (domain_id) REFERENCES directory.wbt_domain(dc);


--
-- Name: calendar_accept_of_day calendar_accept_of_day_calendar_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar_accept_of_day
    ADD CONSTRAINT calendar_accept_of_day_calendar_id_fk FOREIGN KEY (calendar_id) REFERENCES call_center.calendar(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: calendar_acl calendar_acl_calendar_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar_acl
    ADD CONSTRAINT calendar_acl_calendar_id_fk FOREIGN KEY (object) REFERENCES call_center.calendar(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: calendar calendar_calendar_timezones_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar
    ADD CONSTRAINT calendar_calendar_timezones_id_fk FOREIGN KEY (timezone_id) REFERENCES call_center.calendar_timezones(id);


--
-- Name: calendar_except calendar_except_calendar_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar_except
    ADD CONSTRAINT calendar_except_calendar_id_fk FOREIGN KEY (calendar_id) REFERENCES call_center.calendar(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: calendar calendar_wbt_domain_dc_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.calendar
    ADD CONSTRAINT calendar_wbt_domain_dc_fk FOREIGN KEY (domain_id) REFERENCES directory.wbt_domain(dc);


--
-- Name: cc_agent_acl cc_agent_acl_cc_agent_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_acl
    ADD CONSTRAINT cc_agent_acl_cc_agent_id_fk FOREIGN KEY (object) REFERENCES call_center.cc_agent(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_agent_in_queue cc_agent_in_queue_cc_agent_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_in_queue
    ADD CONSTRAINT cc_agent_in_queue_cc_agent_id_fk FOREIGN KEY (agent_id) REFERENCES call_center.cc_agent(id);


--
-- Name: cc_agent_in_queue cc_agent_in_queue_cc_queue_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_in_queue
    ADD CONSTRAINT cc_agent_in_queue_cc_queue_id_fk FOREIGN KEY (queue_id) REFERENCES call_center.cc_queue(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_agent_in_queue cc_agent_in_queue_cc_skils_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_in_queue
    ADD CONSTRAINT cc_agent_in_queue_cc_skils_id_fk FOREIGN KEY (skill_id) REFERENCES call_center.cc_skill(id);


--
-- Name: cc_agent_in_team cc_agent_in_team_cc_agent_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_in_team
    ADD CONSTRAINT cc_agent_in_team_cc_agent_id_fk FOREIGN KEY (agent_id) REFERENCES call_center.cc_agent(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_agent_in_team cc_agent_in_team_cc_skils_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_in_team
    ADD CONSTRAINT cc_agent_in_team_cc_skils_id_fk FOREIGN KEY (skill_id) REFERENCES call_center.cc_skill(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_agent_in_team cc_agent_in_team_cc_team_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_in_team
    ADD CONSTRAINT cc_agent_in_team_cc_team_id_fk FOREIGN KEY (team_id) REFERENCES call_center.cc_team(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_agent_activity cc_agent_statistic_cc_agent_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_activity
    ADD CONSTRAINT cc_agent_statistic_cc_agent_id_fk FOREIGN KEY (agent_id) REFERENCES call_center.cc_agent(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_agent_state_history cc_agent_status_history_cc_agent_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent_state_history
    ADD CONSTRAINT cc_agent_status_history_cc_agent_id_fk FOREIGN KEY (agent_id) REFERENCES call_center.cc_agent(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_agent cc_agent_wbt_domain_dc_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent
    ADD CONSTRAINT cc_agent_wbt_domain_dc_fk FOREIGN KEY (domain_id) REFERENCES directory.wbt_domain(dc);


--
-- Name: cc_agent cc_agent_wbt_user_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_agent
    ADD CONSTRAINT cc_agent_wbt_user_id_fk FOREIGN KEY (user_id) REFERENCES directory.wbt_user(id);


--
-- Name: cc_list_communications cc_list_communications_cc_list_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_list_communications
    ADD CONSTRAINT cc_list_communications_cc_list_id_fk FOREIGN KEY (list_id) REFERENCES call_center.cc_list(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_list cc_list_wbt_domain_dc_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_list
    ADD CONSTRAINT cc_list_wbt_domain_dc_fk FOREIGN KEY (domain_id) REFERENCES directory.wbt_domain(dc) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_member_attempt cc_member_attempt_cc_member_communications_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_attempt
    ADD CONSTRAINT cc_member_attempt_cc_member_communications_id_fk FOREIGN KEY (communication_id) REFERENCES call_center.cc_member_communications(id);


--
-- Name: cc_member_attempt cc_member_attempt_cc_member_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_attempt
    ADD CONSTRAINT cc_member_attempt_cc_member_id_fk FOREIGN KEY (member_id) REFERENCES call_center.cc_member(id);


--
-- Name: cc_member_attempt cc_member_attempt_cc_queue_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_attempt
    ADD CONSTRAINT cc_member_attempt_cc_queue_id_fk FOREIGN KEY (queue_id) REFERENCES call_center.cc_queue(id);


--
-- Name: cc_member_attempt cc_member_attempt_cc_queue_timing_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_attempt
    ADD CONSTRAINT cc_member_attempt_cc_queue_timing_id_fk FOREIGN KEY (timing_id) REFERENCES call_center.cc_queue_timing(id);


--
-- Name: cc_member_attempt_log cc_member_attempt_log_cc_member_communications_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_attempt_log
    ADD CONSTRAINT cc_member_attempt_log_cc_member_communications_id_fk FOREIGN KEY (communication_id) REFERENCES call_center.cc_member_communications(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_member_attempt_log cc_member_attempt_log_cc_member_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_attempt_log
    ADD CONSTRAINT cc_member_attempt_log_cc_member_id_fk FOREIGN KEY (member_id) REFERENCES call_center.cc_member(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_member_attempt_log cc_member_attempt_log_cc_queue_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_attempt_log
    ADD CONSTRAINT cc_member_attempt_log_cc_queue_id_fk FOREIGN KEY (queue_id) REFERENCES call_center.cc_queue(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_member cc_member_cc_queue_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member
    ADD CONSTRAINT cc_member_cc_queue_id_fk FOREIGN KEY (queue_id) REFERENCES call_center.cc_queue(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_member_communications cc_member_communications_cc_communication_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_communications
    ADD CONSTRAINT cc_member_communications_cc_communication_id_fk FOREIGN KEY (communication_id) REFERENCES call_center.cc_communication(id);


--
-- Name: cc_member_communications cc_member_communications_cc_member_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_communications
    ADD CONSTRAINT cc_member_communications_cc_member_id_fk FOREIGN KEY (member_id) REFERENCES call_center.cc_member(id) ON DELETE RESTRICT;


--
-- Name: cc_member_messages cc_member_messages_cc_member_communications_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_messages
    ADD CONSTRAINT cc_member_messages_cc_member_communications_id_fk FOREIGN KEY (communication_id) REFERENCES call_center.cc_member_communications(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_member_messages cc_member_messages_cc_member_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_member_messages
    ADD CONSTRAINT cc_member_messages_cc_member_id_fk FOREIGN KEY (member_id) REFERENCES call_center.cc_member(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_outbound_resource cc_outbound_resource_wbt_domain_dc_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_outbound_resource
    ADD CONSTRAINT cc_outbound_resource_wbt_domain_dc_fk FOREIGN KEY (domain_id) REFERENCES directory.wbt_domain(dc);


--
-- Name: cc_queue cc_queue_calendar_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue
    ADD CONSTRAINT cc_queue_calendar_id_fk FOREIGN KEY (calendar_id) REFERENCES call_center.calendar(id);


--
-- Name: cc_queue cc_queue_cc_list_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue
    ADD CONSTRAINT cc_queue_cc_list_id_fk FOREIGN KEY (dnc_list_id) REFERENCES call_center.cc_list(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- Name: cc_queue cc_queue_cc_team_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue
    ADD CONSTRAINT cc_queue_cc_team_id_fk FOREIGN KEY (team_id) REFERENCES call_center.cc_team(id);


--
-- Name: cc_queue_routing cc_queue_routing_cc_queue_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue_routing
    ADD CONSTRAINT cc_queue_routing_cc_queue_id_fk FOREIGN KEY (queue_id) REFERENCES call_center.cc_queue(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_queue_timing cc_queue_timing_cc_communication_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue_timing
    ADD CONSTRAINT cc_queue_timing_cc_communication_id_fk FOREIGN KEY (communication_id) REFERENCES call_center.cc_communication(id);


--
-- Name: cc_queue_timing cc_queue_timing_cc_queue_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue_timing
    ADD CONSTRAINT cc_queue_timing_cc_queue_id_fk FOREIGN KEY (queue_id) REFERENCES call_center.cc_queue(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_queue cc_queue_wbt_domain_dc_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_queue
    ADD CONSTRAINT cc_queue_wbt_domain_dc_fk FOREIGN KEY (domain_id) REFERENCES directory.wbt_domain(dc);


--
-- Name: cc_resource_in_routing cc_resource_in_queue_cc_outbound_resource_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_resource_in_routing
    ADD CONSTRAINT cc_resource_in_queue_cc_outbound_resource_id_fk FOREIGN KEY (resource_id) REFERENCES call_center.cc_outbound_resource(id);


--
-- Name: cc_resource_in_routing cc_resource_in_routing_cc_queue_routing_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_resource_in_routing
    ADD CONSTRAINT cc_resource_in_routing_cc_queue_routing_id_fk FOREIGN KEY (routing_id) REFERENCES call_center.cc_queue_routing(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_skill_in_agent cc_skill_in_agent_cc_agent_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_skill_in_agent
    ADD CONSTRAINT cc_skill_in_agent_cc_agent_id_fk FOREIGN KEY (agent_id) REFERENCES call_center.cc_agent(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_skill_in_agent cc_skill_in_agent_cc_skils_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_skill_in_agent
    ADD CONSTRAINT cc_skill_in_agent_cc_skils_id_fk FOREIGN KEY (skill_id) REFERENCES call_center.cc_skill(id);


--
-- Name: cc_skill cc_skill_wbt_domain_dc_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_skill
    ADD CONSTRAINT cc_skill_wbt_domain_dc_fk FOREIGN KEY (domain_id) REFERENCES directory.wbt_domain(dc);


--
-- Name: cc_supervisor_in_team cc_supervisor_in_team_cc_agent_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_supervisor_in_team
    ADD CONSTRAINT cc_supervisor_in_team_cc_agent_id_fk FOREIGN KEY (agent_id) REFERENCES call_center.cc_agent(id);


--
-- Name: cc_supervisor_in_team cc_supervisor_in_team_cc_team_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_supervisor_in_team
    ADD CONSTRAINT cc_supervisor_in_team_cc_team_id_fk FOREIGN KEY (team_id) REFERENCES call_center.cc_team(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_team_acl cc_team_acl_cc_team_id_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_team_acl
    ADD CONSTRAINT cc_team_acl_cc_team_id_fk FOREIGN KEY (object) REFERENCES call_center.cc_team(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cc_team cc_team_wbt_domain_dc_fk; Type: FK CONSTRAINT; Schema: call_center; Owner: -
--

ALTER TABLE ONLY call_center.cc_team
    ADD CONSTRAINT cc_team_wbt_domain_dc_fk FOREIGN KEY (domain_id) REFERENCES directory.wbt_domain(dc);


--
-- PostgreSQL database dump complete
--
