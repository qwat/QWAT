<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="2.9.0-Master" minimumScale="0" maximumScale="1e+08" simplifyDrawingHints="0" minLabelScale="0" maxLabelScale="1e+08" simplifyDrawingTol="1" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyLocal="1" scaleBasedLabelVisibilityFlag="0">
 <edittypes>
  <edittype widgetv2type="TextEdit" name="id">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="RelationReference" name="fk_parent">
   <widgetv2config OrderByValue="0" fieldEditable="1" ShowForm="0" Relation="relation_pipe_parent" ReadOnly="1" MapIdentification="1" labelOnTop="0" AllowNULL="1"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="fk_function">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="1" fieldEditable="1" Key="id" Layer="pipe_function" Value="value_fr" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="fk_installmethod">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" Layer="pipe_installmethod" Value="value_fr" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="RelationReference" name="fk_material">
   <widgetv2config OrderByValue="1" fieldEditable="1" ShowForm="0" Relation="relation_pipe_material" ReadOnly="0" MapIdentification="0" labelOnTop="0" AllowNULL="0">
    <FilterFields ChainFilters="1">
     <field name="short_fr"/>
     <field name="diameter"/>
    </FilterFields>
   </widgetv2config>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="fk_distributor">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" Layer="distributor" Value="name" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="fk_precision">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" Layer="precision" Value="value_fr" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="fk_bedding">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" Layer="bedding" Value="value_fr" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="fk_protection">
   <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" Layer="pipe_protection" Value="value_fr" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="fk_status">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" Layer="status" Value="value_fr" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="fk_watertype">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" Layer="watertype" Value="value_fr" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="year">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="tunnel_or_bridge">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pressure_nominal">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="folder">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="remark">
   <widgetv2config IsMultiline="1" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="_valve_count">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="CheckBox" name="_valve_closed">
   <widgetv2config fieldEditable="1" UncheckedState="f" CheckedState="t" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="schema_force_visible">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="vl_code" Layer="visible" Value="value_fr" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="label_1_visible">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="vl_code_int" Layer="visible" Value="value_fr" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="label_1_text">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="label_2_visible">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="vl_code_int" Layer="visible" Value="value_fr" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="label_2_text">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="fk_node_a">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="fk_node_b">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="fk_district">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" Layer="district" Value="name" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="ValueRelation" name="fk_pressurezone">
   <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" Layer="pressurezone" Value="name" labelOnTop="0" AllowMulti="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="fk_printmap">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="_length2d">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="_length3d">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="_diff_elevation">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="_district">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="_pressurezone">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="_printmaps">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="_geometry_alt1_used">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="_geometry_alt2_used">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="geometry_alt1">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="geometry_alt2">
   <widgetv2config IsMultiline="0" fieldEditable="1" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_function_value_fr">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_function_value_en">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_function_value_ro">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_function_schema_visible">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_function_major">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_protection_value_fr">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_protection_value_en">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_protection_value_ro">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pressurezone_name">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pressurezone_colorcode">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="status_value_fr">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="status_value_en">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="status_value_ro">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="status_active">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_material_short_fr">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_material_short_en">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_material_short_ro">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_material_value_fr">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_material_value_en">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_material_value_ro">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_material__displayname_fr">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_material__displayname_en">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_material__displayname_ro">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_material_diameter">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="pipe_material_diameter_nominal">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
  <edittype widgetv2type="TextEdit" name="__schema_visible">
   <widgetv2config IsMultiline="0" fieldEditable="0" UseHtml="0" labelOnTop="0"/>
  </edittype>
 </edittypes>
 <renderer-v2 symbollevels="0" type="RuleRenderer">
  <rules key="{dbde1c2b-a27d-484e-8dd5-d13dcd527b89}">
   <rule filter="fk_distributor = 1and &quot;status_active&quot; = 't'" key="{f550eef3-fdaa-427b-b415-bd7e8fc25f9e}" label="active">
    <rule filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;) = 't' AND fk_status != 1307" key="{1169fb39-5fd3-43b6-9c6c-0f8ef27a0149}" label="Schématique">
     <rule filter=" &quot;pipe_function_major&quot;  = 't'" key="{091e66aa-1594-4ac1-a779-f671dde391e2}" symbol="0" label="principale"/>
     <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{25c2e398-8d5a-4103-ac14-4ff461596d3a}" symbol="1" label="secondaire"/>
     <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{8068754f-f710-413f-b07d-9cf8a386733b}" symbol="2" label="protégée"/>
    </rule>
    <rule scalemaxdenom="3000" filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 'f' AND fk_status != 1307" key="{9646576f-b22a-45bf-a4a3-3678392bd8c0}" label="Détail">
     <rule filter=" &quot;pipe_function_major&quot; = 't'" key="{93d733e3-3119-42cc-89f8-b67d3197925a}" symbol="3" label="principale"/>
     <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{67caa7b7-52d8-494c-9386-6622b1e656a3}" symbol="4" label="secondaire"/>
     <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{6082ca45-b8db-490b-a549-f86a8b5e961b}" symbol="5" label="protégée"/>
    </rule>
    <rule checkstate="0" filter="fk_status=1307" key="{3792c184-3d81-4254-8c66-acdf171e2b71}" symbol="6" label="Fictives"/>
   </rule>
   <rule checkstate="0" filter="fk_distributor = 1and &quot;status_active&quot; = 'f'" key="{75060a73-107d-4ace-bc35-d573de40488f}" label="inactive">
    <rule filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 't'" key="{5b970fd5-5c37-4865-81a5-cab18c5fb58c}" label="Schématique">
     <rule filter=" &quot;pipe_function_major&quot; = 't'" key="{783f2167-c790-4baf-a58d-d6fd65a299a4}" symbol="7" label="principale"/>
     <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{46c7536a-ac7b-4e7b-afe6-33f9fee2f171}" symbol="8" label="secondaire"/>
     <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{bd93e9ea-b64b-4fbd-bf89-6d4395730e60}" symbol="9" label="protégée"/>
    </rule>
    <rule scalemaxdenom="3000" filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 'f'" key="{7d0cfa7a-eaf4-499a-b977-1238b90ca15f}" label="Détail">
     <rule filter=" &quot;pipe_function_major&quot; = 't'" key="{c0af50d9-d68b-4c2f-b9fa-9e2be9ec0e34}" symbol="10" label="principale"/>
     <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{f2f26723-dc46-40c5-abe2-ef61a8c502e3}" symbol="11" label="secondaire"/>
     <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{9486a529-9a4e-4a3c-83fe-86f6f93102c0}" symbol="12" label="protégée"/>
    </rule>
   </rule>
   <rule filter="fk_distributor != 1" key="{013429dc-a1cd-4a17-904a-6550a0175046}" label="étranger">
    <rule filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 't'" key="{2513a8b8-a110-4727-854c-6084f64e3bdf}" label="Schématique">
     <rule filter=" &quot;pipe_function_major&quot; = 't'" key="{f798c83b-a461-46c3-8031-8b5bc3caffd8}" symbol="13" label="principale"/>
     <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{ca06b6f2-f1ee-4958-b79a-6cb6cbc2059b}" symbol="14" label="secondaire"/>
     <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{6c5ec343-05d3-4fcd-8dc1-283232838086}" symbol="15" label="protégée"/>
    </rule>
    <rule scalemaxdenom="3000" filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 'f'" key="{2e14d53a-6d2f-40b3-bf3b-4f32112e3d59}" label="Détail">
     <rule filter=" &quot;pipe_function_major&quot; = 't'" key="{fb522923-eeee-47bb-8352-65a3d5637c4c}" symbol="16" label="principale"/>
     <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{b8c5c345-6f26-4237-a405-a503b361b9da}" symbol="17" label="secondaire"/>
     <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{65e92041-f079-42f0-80be-f3bedfbdcdac}" symbol="18" label="protégée"/>
    </rule>
   </rule>
   <rule checkstate="0" filter="fk_distributor = 1 and &quot;status_active&quot; = 't' and COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 't'" key="{9c210704-187e-4e2a-9b89-2f7917f4376c}" symbol="19" label="Couleur par zone"/>
  </rules>
  <symbols>
   <symbol alpha="1" clip_to_extent="1" type="line" name="0">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,140,255,255"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="0.9"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="1">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="2;1.3"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,140,255,255"/>
     <prop k="line_style" v="dash"/>
     <prop k="line_width" v="0.7"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="1"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="10">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="217,0,0,255"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="0.9"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="11">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="2;1.3"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="217,0,0,255"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="0.7"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="1"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="12">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="flat"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="217,0,0,70"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="2"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="13">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,0,0,255"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="0.9"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="14">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="2;1.3"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,0,0,255"/>
     <prop k="line_style" v="dash"/>
     <prop k="line_width" v="0.7"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="1"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="15">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="flat"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,0,0,70"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="2"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="16">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,0,0,255"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="0.9"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="17">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="2;1.3"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,0,0,255"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="0.7"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="1"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="18">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="flat"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,0,0,70"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="2"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="19">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="color_dd_active" v="1"/>
     <prop k="color_dd_expression" v="CASE WHEN &quot;pressurezone_colorcode&quot; = 1 THEN '21,133,248,255' WHEN &quot;pressurezone_colorcode&quot; = 2 THEN '248,21,64,255' WHEN &quot;pressurezone_colorcode&quot; = 3 THEN '32,205,36,255' ELSE '0,0,0,255' END"/>
     <prop k="color_dd_field" v=""/>
     <prop k="color_dd_useexpr" v="1"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="24,233,178,255"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="0.4"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="2">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="flat"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,140,255,70"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="2"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="3">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,140,255,255"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="0.9"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="4">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="2;1.3"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,140,255,255"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="0.7"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="1"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="5">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="flat"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,140,255,70"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="2"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="6">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="0,0,0,255"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="0.9"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="7">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="217,0,0,255"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="0.9"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="8">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="square"/>
     <prop k="customdash" v="2;1.3"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="217,0,0,255"/>
     <prop k="line_style" v="dash"/>
     <prop k="line_width" v="0.7"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="1"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" type="line" name="9">
    <layer pass="0" class="SimpleLine" locked="0">
     <prop k="capstyle" v="flat"/>
     <prop k="customdash" v="5;2"/>
     <prop k="customdash_map_unit_scale" v="0,0"/>
     <prop k="customdash_unit" v="MM"/>
     <prop k="draw_inside_polygon" v="0"/>
     <prop k="joinstyle" v="bevel"/>
     <prop k="line_color" v="217,0,0,70"/>
     <prop k="line_style" v="solid"/>
     <prop k="line_width" v="2"/>
     <prop k="line_width_unit" v="MM"/>
     <prop k="offset" v="0"/>
     <prop k="offset_map_unit_scale" v="0,0"/>
     <prop k="offset_unit" v="MM"/>
     <prop k="use_custom_dash" v="0"/>
     <prop k="width_map_unit_scale" v="0,0"/>
     <effect enabled="0" type="effectStack">
      <effect type="drawSource">
       <prop k="blend_mode" v="0"/>
       <prop k="draw_mode" v="2"/>
       <prop k="enabled" v="1"/>
       <prop k="transparency" v="0"/>
      </effect>
     </effect>
    </layer>
   </symbol>
  </symbols>
  <effect enabled="0" type="effectStack">
   <effect type="drawSource">
    <prop k="blend_mode" v="0"/>
    <prop k="draw_mode" v="2"/>
    <prop k="enabled" v="1"/>
    <prop k="transparency" v="0"/>
   </effect>
  </effect>
 </renderer-v2>
 <customproperties>
  <property key="LinkIt_destinationField" value="fk_parent"/>
  <property key="LinkIt_name" value="Conduites parent"/>
  <property key="LinkIt_sourceLayer" value="conduites_copy20130709141244955"/>
  <property key="itemBrowserCurrentItem" value="-1"/>
  <property key="itemBrowserSelection" value="[]"/>
  <property key="labeling" value="pal"/>
  <property key="labeling/addDirectionSymbol" value="false"/>
  <property key="labeling/angleOffset" value="0"/>
  <property key="labeling/blendMode" value="0"/>
  <property key="labeling/bufferBlendMode" value="0"/>
  <property key="labeling/bufferColorA" value="255"/>
  <property key="labeling/bufferColorB" value="255"/>
  <property key="labeling/bufferColorG" value="255"/>
  <property key="labeling/bufferColorR" value="255"/>
  <property key="labeling/bufferDraw" value="true"/>
  <property key="labeling/bufferJoinStyle" value="64"/>
  <property key="labeling/bufferNoFill" value="false"/>
  <property key="labeling/bufferSize" value="0.4"/>
  <property key="labeling/bufferSizeInMapUnits" value="false"/>
  <property key="labeling/bufferSizeMapUnitMaxScale" value="0"/>
  <property key="labeling/bufferSizeMapUnitMinScale" value="0"/>
  <property key="labeling/bufferTransp" value="0"/>
  <property key="labeling/centroidInside" value="false"/>
  <property key="labeling/centroidWhole" value="false"/>
  <property key="labeling/dataDefined/AlwaysShow" value="1~~1~~CASE WHEN  &quot;label_1_visible&quot; = 2 THEN 1 ELSE 0 END~~"/>
  <property key="labeling/dataDefined/Show" value="1~~0~~CASE WHEN &quot;fk_labelvisible&quot; = 'f' THEN 0 ELSE 1 END~~label_1_visible"/>
  <property key="labeling/dataDefined/Size" value="1~~1~~CASE&#xa;WHEN $scale > 1500 THEN 6&#xa;WHEN  &quot;pipe_function_schema_visible&quot;  = 't' THEN 8&#xa;ELSE 6&#xa;END~~"/>
  <property key="labeling/decimals" value="0"/>
  <property key="labeling/displayAll" value="false"/>
  <property key="labeling/dist" value="1"/>
  <property key="labeling/distInMapUnits" value="false"/>
  <property key="labeling/distMapUnitMaxScale" value="0"/>
  <property key="labeling/distMapUnitMinScale" value="0"/>
  <property key="labeling/enabled" value="true"/>
  <property key="labeling/fieldName" value=" replace( &quot;pipe_material_short_fr&quot;||' ','Inconnu ','')&#xa; ||&#xa; &quot;pipe_material_diameter&quot;&#xa; ||&#xa; CASE&#xa;WHEN  $scale  &lt; 501  AND  $length > 4 AND  &quot;fk_precision&quot; IN (1101,1103,1105) THEN ' imprécis'&#xa; ELSE ''&#xa; END&#xa;||&#xa; CASE&#xa;WHEN  $scale  &lt; 501  AND  $length > 4 THEN COALESCE('\n' ||&quot;year&quot;,'')&#xa;WHEN  $scale  >= 1000 THEN COALESCE(' ' ||&quot;year&quot;,'')&#xa; ELSE ''&#xa; END&#xa;||&#xa;CASE&#xa;WHEN  $scale  &lt;= 3000 THEN  COALESCE('\n'||  &quot;pipe_protection_value_fr&quot;, '')&#xa; ELSE ''&#xa;END&#xa;||&#xa;CASE&#xa;WHEN  $scale  &lt;= 6000  THEN  COALESCE(' ' ||&quot;label_1_text&quot;,'')&#xa; ELSE ''&#xa;END"/>
  <property key="labeling/fontBold" value="false"/>
  <property key="labeling/fontCapitals" value="0"/>
  <property key="labeling/fontFamily" value="Cantarell"/>
  <property key="labeling/fontItalic" value="false"/>
  <property key="labeling/fontLetterSpacing" value="0"/>
  <property key="labeling/fontLimitPixelSize" value="false"/>
  <property key="labeling/fontMaxPixelSize" value="10000"/>
  <property key="labeling/fontMinPixelSize" value="3"/>
  <property key="labeling/fontSize" value="7"/>
  <property key="labeling/fontSizeInMapUnits" value="false"/>
  <property key="labeling/fontSizeMapUnitMaxScale" value="0"/>
  <property key="labeling/fontSizeMapUnitMinScale" value="0"/>
  <property key="labeling/fontStrikeout" value="false"/>
  <property key="labeling/fontUnderline" value="false"/>
  <property key="labeling/fontWeight" value="50"/>
  <property key="labeling/fontWordSpacing" value="0"/>
  <property key="labeling/formatNumbers" value="false"/>
  <property key="labeling/isExpression" value="true"/>
  <property key="labeling/labelOffsetInMapUnits" value="true"/>
  <property key="labeling/labelOffsetMapUnitMaxScale" value="0"/>
  <property key="labeling/labelOffsetMapUnitMinScale" value="0"/>
  <property key="labeling/labelPerPart" value="false"/>
  <property key="labeling/leftDirectionSymbol" value="&lt;"/>
  <property key="labeling/limitNumLabels" value="false"/>
  <property key="labeling/maxCurvedCharAngleIn" value="20"/>
  <property key="labeling/maxCurvedCharAngleOut" value="-20"/>
  <property key="labeling/maxNumLabels" value="2000"/>
  <property key="labeling/mergeLines" value="false"/>
  <property key="labeling/minFeatureSize" value="0"/>
  <property key="labeling/multilineAlign" value="1"/>
  <property key="labeling/multilineHeight" value="0.9"/>
  <property key="labeling/namedStyle" value="Regular"/>
  <property key="labeling/obstacle" value="true"/>
  <property key="labeling/placeDirectionSymbol" value="0"/>
  <property key="labeling/placement" value="2"/>
  <property key="labeling/placementFlags" value="14"/>
  <property key="labeling/plussign" value="false"/>
  <property key="labeling/preserveRotation" value="true"/>
  <property key="labeling/previewBkgrdColor" value="#ffffff"/>
  <property key="labeling/priority" value="6"/>
  <property key="labeling/quadOffset" value="4"/>
  <property key="labeling/repeatDistance" value="0"/>
  <property key="labeling/repeatDistanceMapUnitMaxScale" value="0"/>
  <property key="labeling/repeatDistanceMapUnitMinScale" value="0"/>
  <property key="labeling/repeatDistanceUnit" value="1"/>
  <property key="labeling/reverseDirectionSymbol" value="false"/>
  <property key="labeling/rightDirectionSymbol" value=">"/>
  <property key="labeling/scaleMax" value="6000"/>
  <property key="labeling/scaleMin" value="0"/>
  <property key="labeling/scaleVisibility" value="true"/>
  <property key="labeling/shadowBlendMode" value="6"/>
  <property key="labeling/shadowColorB" value="0"/>
  <property key="labeling/shadowColorG" value="0"/>
  <property key="labeling/shadowColorR" value="0"/>
  <property key="labeling/shadowDraw" value="false"/>
  <property key="labeling/shadowOffsetAngle" value="135"/>
  <property key="labeling/shadowOffsetDist" value="1"/>
  <property key="labeling/shadowOffsetGlobal" value="true"/>
  <property key="labeling/shadowOffsetMapUnitMaxScale" value="0"/>
  <property key="labeling/shadowOffsetMapUnitMinScale" value="0"/>
  <property key="labeling/shadowOffsetUnits" value="1"/>
  <property key="labeling/shadowRadius" value="1.5"/>
  <property key="labeling/shadowRadiusAlphaOnly" value="false"/>
  <property key="labeling/shadowRadiusMapUnitMaxScale" value="0"/>
  <property key="labeling/shadowRadiusMapUnitMinScale" value="0"/>
  <property key="labeling/shadowRadiusUnits" value="1"/>
  <property key="labeling/shadowScale" value="100"/>
  <property key="labeling/shadowTransparency" value="30"/>
  <property key="labeling/shadowUnder" value="0"/>
  <property key="labeling/shapeBlendMode" value="0"/>
  <property key="labeling/shapeBorderColorA" value="255"/>
  <property key="labeling/shapeBorderColorB" value="128"/>
  <property key="labeling/shapeBorderColorG" value="128"/>
  <property key="labeling/shapeBorderColorR" value="128"/>
  <property key="labeling/shapeBorderWidth" value="0"/>
  <property key="labeling/shapeBorderWidthMapUnitMaxScale" value="0"/>
  <property key="labeling/shapeBorderWidthMapUnitMinScale" value="0"/>
  <property key="labeling/shapeBorderWidthUnits" value="1"/>
  <property key="labeling/shapeDraw" value="false"/>
  <property key="labeling/shapeFillColorA" value="255"/>
  <property key="labeling/shapeFillColorB" value="255"/>
  <property key="labeling/shapeFillColorG" value="255"/>
  <property key="labeling/shapeFillColorR" value="255"/>
  <property key="labeling/shapeJoinStyle" value="64"/>
  <property key="labeling/shapeOffsetMapUnitMaxScale" value="0"/>
  <property key="labeling/shapeOffsetMapUnitMinScale" value="0"/>
  <property key="labeling/shapeOffsetUnits" value="1"/>
  <property key="labeling/shapeOffsetX" value="0"/>
  <property key="labeling/shapeOffsetY" value="0"/>
  <property key="labeling/shapeRadiiMapUnitMaxScale" value="0"/>
  <property key="labeling/shapeRadiiMapUnitMinScale" value="0"/>
  <property key="labeling/shapeRadiiUnits" value="1"/>
  <property key="labeling/shapeRadiiX" value="0"/>
  <property key="labeling/shapeRadiiY" value="0"/>
  <property key="labeling/shapeRotation" value="0"/>
  <property key="labeling/shapeRotationType" value="0"/>
  <property key="labeling/shapeSVGFile" value=""/>
  <property key="labeling/shapeSizeMapUnitMaxScale" value="0"/>
  <property key="labeling/shapeSizeMapUnitMinScale" value="0"/>
  <property key="labeling/shapeSizeType" value="0"/>
  <property key="labeling/shapeSizeUnits" value="1"/>
  <property key="labeling/shapeSizeX" value="0"/>
  <property key="labeling/shapeSizeY" value="0"/>
  <property key="labeling/shapeTransparency" value="0"/>
  <property key="labeling/shapeType" value="0"/>
  <property key="labeling/textColorA" value="255"/>
  <property key="labeling/textColorB" value="255"/>
  <property key="labeling/textColorG" value="0"/>
  <property key="labeling/textColorR" value="0"/>
  <property key="labeling/textTransp" value="0"/>
  <property key="labeling/upsidedownLabels" value="0"/>
  <property key="labeling/wrapChar" value=""/>
  <property key="labeling/xOffset" value="0"/>
  <property key="labeling/xQuadOffset" value="0"/>
  <property key="labeling/yOffset" value="0"/>
  <property key="labeling/yQuadOffset" value="0"/>
 </customproperties>
 <blendMode>0</blendMode>
 <featureBlendMode>0</featureBlendMode>
 <layerTransparency>0</layerTransparency>
 <displayfield>id</displayfield>
 <label>0</label>
 <labelattributes>
  <label fieldname="" text="Label"/>
  <family fieldname="" name="Ubuntu"/>
  <size fieldname="" units="pt" value="12"/>
  <bold fieldname="" on="0"/>
  <italic fieldname="" on="0"/>
  <underline fieldname="" on="0"/>
  <strikeout fieldname="" on="0"/>
  <color fieldname="" red="0" blue="0" green="0"/>
  <x fieldname=""/>
  <y fieldname=""/>
  <offset x="0" y="0" units="pt" yfieldname="" xfieldname=""/>
  <angle fieldname="" value="0" auto="0"/>
  <alignment fieldname="" value="center"/>
  <buffercolor fieldname="" red="255" blue="255" green="255"/>
  <buffersize fieldname="" units="pt" value="1"/>
  <bufferenabled fieldname="" on=""/>
  <multilineenabled fieldname="" on=""/>
  <selectedonly on=""/>
 </labelattributes>
 <SingleCategoryDiagramRenderer diagramType="Pie">
  <DiagramCategory penColor="#000000" labelPlacementMethod="XHeight" penWidth="0" diagramOrientation="Up" minimumSize="0" barWidth="5" penAlpha="255" maxScaleDenominator="1e+08" font="Cantarell,11,-1,5,50,0,0,0,0,0" backgroundColor="#ffffff" transparency="0" width="30" scaleDependency="Area" backgroundAlpha="255" angleOffset="1440" scaleBasedVisibility="0" enabled="1" height="30" sizeType="MM" minScaleDenominator="0">
   <attribute field="" color="#000000" label=""/>
  </DiagramCategory>
 </SingleCategoryDiagramRenderer>
 <DiagramLayerSettings yPosColumn="-1" linePlacementFlags="1" placement="0" dist="0" xPosColumn="-1" priority="0" obstacle="0" showAll="0"/>
 <editform>./ui_forms/pipe.ui</editform>
 <editforminit/>
 <featformsuppress>0</featformsuppress>
 <annotationform>.</annotationform>
 <editorlayout>uifilelayout</editorlayout>
 <excludeAttributesWMS/>
 <excludeAttributesWFS/>
 <attributeactions>
  <actionsetting action="qgis.utils.plugins['postgres91plusauditor'].audit('pipe20130507153818274',[% $id %])" icon="" capture="0" type="1" name="History audit"/>
  <actionsetting action="qgis.utils.plugins['linkit'].linkit('conduites_copy20130709141244955','fk_parent','conduites_copy20130709141244955', [% $id %])" icon="" capture="0" type="1" name="Conduites parent"/>
 </attributeactions>
</qgis>
