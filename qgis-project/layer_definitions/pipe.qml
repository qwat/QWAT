<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="2.18.0" simplifyAlgorithm="0" minimumScale="100000" maximumScale="1e+08" simplifyDrawingHints="0" minLabelScale="0" maxLabelScale="1e+08" simplifyDrawingTol="1" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyLocal="1" scaleBasedLabelVisibilityFlag="0">
  <edittypes>
    <edittype widgetv2type="TextEdit" name="id">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="RelationReference" name="fk_parent">
      <widgetv2config OrderByValue="0" fieldEditable="1" AllowAddFeatures="0" ShowForm="0" Relation="relation_pipe_parent" ReadOnly="1" constraint="" MapIdentification="1" labelOnTop="0" constraintDescription="" notNull="0" AllowNULL="1"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="fk_function">
      <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="1" fieldEditable="1" Key="id" constraint="" Layer="vl_pipe_function20130304110005186" Value="value_fr" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="fk_installmethod">
      <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" constraint="" Layer="vl_pipe_installmethod20130304110005209" Value="value_fr" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="RelationReference" name="fk_material">
      <widgetv2config OrderByValue="0" fieldEditable="1" AllowAddFeatures="0" ShowForm="0" Relation="relation_pipe_material" ReadOnly="0" constraint="" MapIdentification="0" labelOnTop="0" constraintDescription="" notNull="0" AllowNULL="0">
        <FilterFields ChainFilters="1">
          <field name="short_fr"/>
          <field name="diameter"/>
        </FilterFields>
      </widgetv2config>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="fk_distributor">
      <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" constraint="" Layer="distributor20130304114719702" Value="name" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="fk_precision">
      <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" constraint="" Layer="vl_precision20130304110011372" Value="value_fr" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="fk_bedding">
      <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" constraint="" Layer="vl_bedding20141219112927344" Value="value_fr" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="fk_protection">
      <widgetv2config OrderByValue="1" AllowNull="1" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" constraint="" Layer="vl_pipe_protection20130304110005258" Value="value_fr" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="fk_status">
      <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" constraint="" Layer="vl_status20130304110011436" Value="value_fr" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="fk_watertype">
      <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="id" constraint="" Layer="vl_watertype20131217141603877" Value="value_fr" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="fk_locationtype">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="RelationReference" name="fk_folder">
      <widgetv2config OrderByValue="1" fieldEditable="1" AllowAddFeatures="0" ShowForm="0" Relation="relation_pipe_folder" ReadOnly="0" constraint="" MapIdentification="1" labelOnTop="0" constraintDescription="" notNull="0" AllowNULL="1"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="year">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="year_rehabilitation">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="year_end">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="CheckBox" name="tunnel_or_bridge">
      <widgetv2config fieldEditable="1" UncheckedState="f" constraint="" CheckedState="t" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pressure_nominal">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="remark">
      <widgetv2config IsMultiline="1" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="_valve_count">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="CheckBox" name="_valve_closed">
      <widgetv2config fieldEditable="0" UncheckedState="f" constraint="" CheckedState="t" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="schema_force_visible">
      <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="vl_code" constraint="" Layer="vl_visible20130304110011703" Value="value_fr" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="label_1_visible">
      <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="vl_code_int" constraint="" Layer="vl_visible20130304110011703" Value="value_fr" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="label_1_text">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="label_2_visible">
      <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="1" Key="vl_code_int" constraint="" Layer="vl_visible20130304110011703" Value="value_fr" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="label_2_text">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="fk_node_a">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="fk_node_b">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="fk_district">
      <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="0" Key="id" constraint="" Layer="district20130304110004764" Value="name" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="ValueRelation" name="fk_pressurezone">
      <widgetv2config OrderByValue="0" AllowNull="0" FilterExpression="" UseCompleter="0" fieldEditable="0" Key="id" constraint="" Layer="pressurezone20130417133612105" Value="name" labelOnTop="0" constraintDescription="" AllowMulti="0" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="fk_printmap">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="_length2d">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="_length3d">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="_diff_elevation">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="_printmaps">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="_geometry_alt1_used">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="_geometry_alt2_used">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="update_geometry_alt1">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="update_geometry_alt2">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="geometry_alt1">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="geometry_alt2">
      <widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_function_value_fr">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_function_value_en">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_function_value_ro">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_function_schema_visible">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_function_major">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_protection_value_fr">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_protection_value_en">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_protection_value_ro">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pressurezone_name">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pressurezone_colorcode">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_material_short_fr">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_material_short_en">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_material_short_ro">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_material_value_fr">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_material_value_en">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_material_value_ro">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_material__displayname_fr">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_material__displayname_en">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_material__displayname_ro">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_material_diameter">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_material_diameter_nominal">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="pipe_material_diameter_external">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="status_value_fr">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="status_value_en">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="status_value_ro">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="status_active">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
    <edittype widgetv2type="TextEdit" name="__schema_visible">
      <widgetv2config IsMultiline="0" fieldEditable="0" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
    </edittype>
  </edittypes>
  <renderer-v2 forceraster="0" symbollevels="0" type="RuleRenderer" enableorderby="0">
    <rules key="{dbde1c2b-a27d-484e-8dd5-d13dcd527b89}">
      <rule filter="fk_distributor = 1  and &quot;status_value_en&quot; =  'in use' " key="{f550eef3-fdaa-427b-b415-bd7e8fc25f9e}" label="fonctionel">
        <rule filter="status_active = 't'" key="{f683634b-6b3e-459a-b735-1e5d0fe53ae9}" label="actif">
          <rule filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;) = 't' AND fk_status != 1307" key="{1db41c6f-d632-42a2-a453-287300377f48}" label="Schématique">
            <rule filter=" &quot;pipe_function_major&quot;  = 't'" key="{684b69b2-b4e2-49e4-82f1-ea1e9a680e64}" symbol="0" label="principale"/>
            <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{d0b9168b-e603-49dd-8c84-e17551131f81}" symbol="1" label="secondaire"/>
            <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{59ae2c57-00c7-4afe-bfba-16af06381694}" symbol="2" label="protégée"/>
            <rule scalemaxdenom="3000" filter=" &quot;fk_installmethod&quot;  =4202" key="{1d54e4f9-8261-4fb7-ab45-581756bf08a2}" symbol="3" scalemindenom="1" label="chemisée"/>
          </rule>
          <rule scalemaxdenom="3000" filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 'f' AND fk_status != 1307" key="{cbedc12d-c79c-4e2f-b007-5bbfcaa3cfd2}" label="Détail">
            <rule filter=" &quot;pipe_function_major&quot; = 't'" key="{af5a1df4-2d61-4c6c-9951-0f6f900354d9}" symbol="4" label="principale"/>
            <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{03ff9811-2539-4b32-b396-20796c2639bf}" symbol="5" label="secondaire"/>
            <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{ad349920-d2f8-4ac3-ae12-639c93ed9224}" symbol="6" label="protégée"/>
            <rule scalemaxdenom="3000" filter=" &quot;fk_installmethod&quot;  =4202" key="{ab1fe7d1-2f11-4eea-915b-f4a08a217886}" symbol="7" scalemindenom="1" label="chemisée"/>
          </rule>
        </rule>
        <rule filter="status_active = 'f'" key="{d1bbbb53-b702-4d56-9f8b-ccf8029e5318}" label="inactif">
          <rule filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 't'" key="{85a03431-ffdc-4bd4-9796-2113d60c4125}" label="Schématique">
            <rule filter=" &quot;pipe_function_major&quot; = 't'" key="{6f5c08e7-bf93-4eee-94df-3f749becb926}" symbol="8" label="principale"/>
            <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{8f3bf5ad-c837-4d67-9ba8-2a0c37ad6ae0}" symbol="9" label="secondaire"/>
            <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{1c3be22e-50cf-4ddb-a382-cb79acc30446}" symbol="10" label="protégée"/>
            <rule scalemaxdenom="3000" filter=" &quot;fk_installmethod&quot;  =4202" key="{835c4cad-787b-45b7-b242-516a4da8a7f7}" symbol="11" scalemindenom="1" label="chemisée"/>
          </rule>
          <rule scalemaxdenom="3000" filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 'f'" key="{d7cd7ce7-c1fb-444f-9fd7-375e42e1119d}" label="Détail">
            <rule filter=" &quot;pipe_function_major&quot; = 't'" key="{820fcdfc-cca8-4a16-a307-192cf4ddd396}" symbol="12" label="principale"/>
            <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{1f73b079-4d8c-4982-b2ab-6e9b5756b800}" symbol="13" label="secondaire"/>
            <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{e3509205-7271-40dd-aa3a-b8edce4c3ffe}" symbol="14" label="protégée"/>
            <rule scalemaxdenom="3000" filter=" &quot;fk_installmethod&quot;  =4202" key="{846076c3-b88b-4391-801a-578d0abcdaf9}" symbol="15" scalemindenom="1" label="chemisée"/>
          </rule>
        </rule>
        <rule filter="fk_status=1307" key="{7c5fde76-05d7-4d4a-9eaa-953db28fbe87}" symbol="16" label="Fictives"/>
      </rule>
      <rule filter="fk_distributor = 1  and &quot;status_value_en&quot; =   'out of service' " key="{75060a73-107d-4ace-bc35-d573de40488f}" label="non fonctionnel">
        <rule filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 't'" key="{5b970fd5-5c37-4865-81a5-cab18c5fb58c}" label="Schématique">
          <rule filter=" &quot;pipe_function_major&quot; = 't'" key="{783f2167-c790-4baf-a58d-d6fd65a299a4}" symbol="17" label="principale"/>
          <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{46c7536a-ac7b-4e7b-afe6-33f9fee2f171}" symbol="18" label="secondaire"/>
          <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{bd93e9ea-b64b-4fbd-bf89-6d4395730e60}" symbol="19" label="protégée"/>
          <rule scalemaxdenom="3000" filter=" &quot;fk_installmethod&quot;  =4202" key="{74f7b3d4-379f-41de-8006-12185dd708e0}" symbol="20" scalemindenom="1" label="chemisée"/>
        </rule>
        <rule scalemaxdenom="3000" filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 'f'" key="{7d0cfa7a-eaf4-499a-b977-1238b90ca15f}" label="Détail">
          <rule filter=" &quot;pipe_function_major&quot; = 't'" key="{c0af50d9-d68b-4c2f-b9fa-9e2be9ec0e34}" symbol="21" label="principale"/>
          <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{f2f26723-dc46-40c5-abe2-ef61a8c502e3}" symbol="22" label="secondaire"/>
          <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{9486a529-9a4e-4a3c-83fe-86f6f93102c0}" symbol="23" label="protégée"/>
          <rule scalemaxdenom="3000" filter=" &quot;fk_installmethod&quot;  =4202" key="{d7881ca8-054a-42d7-8a53-bc586b51d9de}" symbol="24" scalemindenom="1" label="chemisée"/>
        </rule>
      </rule>
      <rule filter="fk_distributor != 1" key="{013429dc-a1cd-4a17-904a-6550a0175046}" label="étranger">
        <rule filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 't'" key="{2513a8b8-a110-4727-854c-6084f64e3bdf}" label="Schématique">
          <rule filter=" &quot;pipe_function_major&quot; = 't'" key="{f798c83b-a461-46c3-8031-8b5bc3caffd8}" symbol="25" label="principale"/>
          <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{ca06b6f2-f1ee-4958-b79a-6cb6cbc2059b}" symbol="26" label="secondaire"/>
          <rule scalemaxdenom="3000" filter=" &quot;fk_installmethod&quot;  =4202" key="{8a8783e2-f346-41fc-b13b-f815824d51f5}" symbol="27" scalemindenom="1" label="chemisée"/>
          <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{6c5ec343-05d3-4fcd-8dc1-283232838086}" symbol="28" label="protégée"/>
        </rule>
        <rule scalemaxdenom="3000" filter="COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 'f'" key="{2e14d53a-6d2f-40b3-bf3b-4f32112e3d59}" label="Détail">
          <rule filter=" &quot;pipe_function_major&quot; = 't'" key="{fb522923-eeee-47bb-8352-65a3d5637c4c}" symbol="29" label="principale"/>
          <rule filter=" &quot;pipe_function_major&quot; = 'f'" key="{1c861330-b48b-4ae4-91a2-d8e1a336c5f9}" symbol="30" label="secondaire"/>
          <rule filter=" &quot;fk_protection&quot; IS NOT NULL" key="{e9048c41-9d67-475a-8909-a027412c34d1}" symbol="31" label="protégée"/>
          <rule scalemaxdenom="3000" filter=" &quot;fk_installmethod&quot;  =4202" key="{2ce95337-6d17-4772-a67e-31f016923af4}" symbol="32" scalemindenom="1" label="chemisée"/>
        </rule>
      </rule>
      <rule checkstate="0" filter="fk_distributor = 1 and &quot;status_active&quot; = 't' and COALESCE( &quot;schema_force_visible&quot;,  &quot;pipe_function_schema_visible&quot;)  = 't'" key="{9c210704-187e-4e2a-9b89-2f7917f4376c}" symbol="33" label="Couleur par zone"/>
      <rule checkstate="0" filter="Else" key="{bb9b38f1-c76d-4c6d-908b-414f0cc24f97}" symbol="34" label="incomplètes"/>
    </rules>
    <symbols>
      <symbol alpha="1" clip_to_extent="1" type="line" name="0">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,140,255,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.9"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,140,255,255"/>
          <prop k="line_style" v="dash"/>
          <prop k="line_width" v="0.7"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,70"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="2"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 1.2&#xa;ELSE 1.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="-1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="5.55112e-17"/>
              <prop k="translate_y" v="1.6"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="0"/>
              <prop k="translate_y" v="-1.6"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" type="line" name="12">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.9"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="customdash" v="2;1.3"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.7"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,70"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="2"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 1.2&#xa;ELSE 1.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="-1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="5.55112e-17"/>
              <prop k="translate_y" v="1.6"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="0"/>
              <prop k="translate_y" v="-1.6"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" type="line" name="16">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.9"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.9"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="2;1.3"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="dash"/>
          <prop k="line_width" v="0.7"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,70"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="2"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 1.2&#xa;ELSE 1.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,140,255,70"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="2"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 1.2&#xa;ELSE 1.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="20">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="-1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="5.55112e-17"/>
              <prop k="translate_y" v="1.6"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="0"/>
              <prop k="translate_y" v="-1.6"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" type="line" name="21">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.9"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="22">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="2;1.3"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.7"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="23">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,70"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="2"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 1.2&#xa;ELSE 1.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="24">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="-1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="5.55112e-17"/>
              <prop k="translate_y" v="1.6"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="0"/>
              <prop k="translate_y" v="-1.6"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" type="line" name="25">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="40,180,16,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.9"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="26">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="2;1.3"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="40,180,16,255"/>
          <prop k="line_style" v="dash"/>
          <prop k="line_width" v="0.7"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="27">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="40,180,16,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="-1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="5.55112e-17"/>
              <prop k="translate_y" v="1.6"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="40,180,16,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="0"/>
              <prop k="translate_y" v="-1.6"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" type="line" name="28">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="40,180,16,69"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="2"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 1.2&#xa;ELSE 1.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="29">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="40,180,16,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.9"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,140,255,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="-1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="5.55112e-17"/>
              <prop k="translate_y" v="1.6"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,140,255,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="0"/>
              <prop k="translate_y" v="-1.6"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" type="line" name="30">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="2;1.3"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="40,180,16,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.7"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="31">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="40,180,16,69"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="2"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 1.2&#xa;ELSE 1.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="32">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="40,180,16,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="-1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="5.55112e-17"/>
              <prop k="translate_y" v="1.6"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="40,180,16,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="0"/>
              <prop k="translate_y" v="-1.6"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" type="line" name="33">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color_dd_active" v="1"/>
          <prop k="color_dd_expression" v="CASE WHEN &quot;pressurezone_colorcode&quot; = 1 THEN '21,133,248,255' WHEN &quot;pressurezone_colorcode&quot; = 2 THEN '248,21,64,255' WHEN &quot;pressurezone_colorcode&quot; = 3 THEN '32,205,36,255' ELSE '0,0,0,255' END"/>
          <prop k="color_dd_field" v=""/>
          <prop k="color_dd_useexpr" v="1"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="24,233,178,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.4"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
      <symbol alpha="1" clip_to_extent="1" type="line" name="34">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="243,69,255,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" type="line" name="4">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,140,255,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.9"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="2;1.3"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,140,255,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.7"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,140,255,70"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="2"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 1.2&#xa;ELSE 1.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,140,255,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="-1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="5.55112e-17"/>
              <prop k="translate_y" v="1.6"/>
            </effect>
          </effect>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,140,255,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="1.2"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
          <effect enabled="0" type="effectStack">
            <effect type="transform">
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="reflect_x" v="0"/>
              <prop k="reflect_y" v="0"/>
              <prop k="rotation" v="0"/>
              <prop k="scale_x" v="1"/>
              <prop k="scale_y" v="1"/>
              <prop k="shear_x" v="0"/>
              <prop k="shear_y" v="0"/>
              <prop k="translate_unit" v="MM"/>
              <prop k="translate_unit_scale" v="0,0,0,0,0,0"/>
              <prop k="translate_x" v="0"/>
              <prop k="translate_y" v="-1.6"/>
            </effect>
          </effect>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" type="line" name="8">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.9"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="2;1.3"/>
          <prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="217,0,0,255"/>
          <prop k="line_style" v="dash"/>
          <prop k="line_width" v="0.7"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width_dd_active" v="1"/>
          <prop k="width_dd_expression" v="CASE WHEN &quot;pipe_material_diameter&quot; is not NULL&#xa;THEN toreal(COALESCE(&quot;pipe_material_diameter_external&quot;,&quot;pipe_material_diameter_nominal&quot;)) / 900 + 0.2&#xa;ELSE 0.2&#xa;END"/>
          <prop k="width_dd_field" v=""/>
          <prop k="width_dd_useexpr" v="1"/>
          <prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
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
  <labeling type="rule-based">
    <rules key="{f8ea8646-59dc-44cd-baa8-d4fe09362489}">
      <rule scalemaxdenom="3000" description="Matériau - diamètre- année" key="{192be03d-5b96-4d4f-b64c-64d310c80bf1}" scalemindenom="1">
        <settings>
          <text-style fontItalic="0" fontFamily="Lato" fontLetterSpacing="0" fontUnderline="0" fontWeight="50" fontStrikeout="0" textTransp="0" previewBkgrdColor="#ffffff" fontCapitals="0" textColor="0,80,255,255" fontSizeInMapUnits="0" isExpression="1" blendMode="0" fontSizeMapUnitScale="0,0,0,0,0,0" fontSize="8" fieldName=" replace( &quot;pipe_material_short_fr&quot;||' ','Inconnu ','') ||  &quot;pipe_material_diameter&quot;&#xa;" namedStyle="Regular" fontWordSpacing="0" useSubstitutions="0">
            <substitutions/>
          </text-style>
          <text-format placeDirectionSymbol="0" multilineAlign="0" rightDirectionSymbol=">" multilineHeight="1" plussign="0" addDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0" decimals="3" wrapChar="" reverseDirectionSymbol="0"/>
          <text-buffer bufferSize="1" bufferSizeMapUnitScale="0,0,0,0,0,0" bufferColor="255,255,255,255" bufferDraw="0" bufferBlendMode="0" bufferTransp="0" bufferSizeInMapUnits="0" bufferNoFill="0" bufferJoinStyle="64"/>
          <background shapeSizeUnits="1" shapeType="0" shapeSVGFile="" shapeOffsetX="0" shapeOffsetY="0" shapeBlendMode="0" shapeFillColor="255,255,255,255" shapeTransparency="0" shapeSizeMapUnitScale="0,0,0,0,0,0" shapeSizeType="0" shapeJoinStyle="64" shapeDraw="0" shapeBorderWidthUnits="1" shapeSizeX="0" shapeSizeY="0" shapeOffsetMapUnitScale="0,0,0,0,0,0" shapeRadiiX="0" shapeRadiiY="0" shapeOffsetUnits="1" shapeRotation="0" shapeBorderWidth="0" shapeBorderColor="128,128,128,255" shapeRotationType="0" shapeBorderWidthMapUnitScale="0,0,0,0,0,0" shapeRadiiMapUnitScale="0,0,0,0,0,0" shapeRadiiUnits="1"/>
          <shadow shadowOffsetMapUnitScale="0,0,0,0,0,0" shadowOffsetGlobal="1" shadowRadiusUnits="1" shadowTransparency="30" shadowColor="0,0,0,255" shadowUnder="0" shadowScale="100" shadowOffsetDist="1" shadowDraw="0" shadowOffsetAngle="135" shadowRadius="1,5" shadowRadiusMapUnitScale="0,0,0,0,0,0" shadowBlendMode="6" shadowRadiusAlphaOnly="0" shadowOffsetUnits="1"/>
          <placement repeatDistanceUnit="1" placement="2" maxCurvedCharAngleIn="20" repeatDistance="0" distInMapUnits="0" labelOffsetInMapUnits="1" xOffset="0" distMapUnitScale="0,0,0,0,0,0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" preserveRotation="1" repeatDistanceMapUnitScale="0,0,0,0,0,0" centroidWhole="0" priority="5" yOffset="0" offsetType="0" placementFlags="14" centroidInside="0" dist="1" angleOffset="0" maxCurvedCharAngleOut="-20" fitInPolygonOnly="0" quadOffset="4" labelOffsetMapUnitScale="0,0,0,0,0,0"/>
          <rendering fontMinPixelSize="3" scaleMax="10000000" fontMaxPixelSize="10000" scaleMin="1" upsidedownLabels="0" limitNumLabels="0" obstacle="1" obstacleFactor="1" scaleVisibility="0" fontLimitPixelSize="0" mergeLines="0" obstacleType="0" labelPerPart="0" zIndex="0" maxNumLabels="2000" displayAll="0" minFeatureSize="4"/>
          <data-defined>
            <Size expr="CASE WHEN $scale &lt; 3000 THEN 8 ELSE 6 END" field="" active="true" useExpr="true"/>
            <Show expr="" field="label_1_visible" active="true" useExpr="false"/>
            <AlwaysShow expr="CASE WHEN  &quot;label_1_visible&quot; = 2 THEN 1 ELSE 0 END" field="" active="true" useExpr="true"/>
          </data-defined>
        </settings>
      </rule>
      <rule scalemaxdenom="501" description="Imprécis" filter="&quot;fk_precision&quot; IN (1101,1103,1105)" key="{4a98a69d-ec73-4410-af71-b397afa6bd91}" scalemindenom="1">
        <settings>
          <text-style fontItalic="0" fontFamily="Lato" fontLetterSpacing="0" fontUnderline="0" fontWeight="50" fontStrikeout="0" textTransp="0" previewBkgrdColor="#ffffff" fontCapitals="0" textColor="0,80,255,255" fontSizeInMapUnits="0" isExpression="1" blendMode="0" fontSizeMapUnitScale="0,0,0,0,0,0" fontSize="8" fieldName="' Imprécis '" namedStyle="Regular" fontWordSpacing="0" useSubstitutions="0">
            <substitutions/>
          </text-style>
          <text-format placeDirectionSymbol="0" multilineAlign="0" rightDirectionSymbol=">" multilineHeight="1" plussign="0" addDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0" decimals="3" wrapChar="" reverseDirectionSymbol="0"/>
          <text-buffer bufferSize="1" bufferSizeMapUnitScale="0,0,0,0,0,0" bufferColor="255,255,255,255" bufferDraw="0" bufferBlendMode="0" bufferTransp="0" bufferSizeInMapUnits="0" bufferNoFill="0" bufferJoinStyle="64"/>
          <background shapeSizeUnits="1" shapeType="0" shapeSVGFile="" shapeOffsetX="0" shapeOffsetY="0" shapeBlendMode="0" shapeFillColor="255,255,255,255" shapeTransparency="0" shapeSizeMapUnitScale="0,0,0,0,0,0" shapeSizeType="0" shapeJoinStyle="64" shapeDraw="0" shapeBorderWidthUnits="1" shapeSizeX="0" shapeSizeY="0" shapeOffsetMapUnitScale="0,0,0,0,0,0" shapeRadiiX="0" shapeRadiiY="0" shapeOffsetUnits="1" shapeRotation="0" shapeBorderWidth="0" shapeBorderColor="128,128,128,255" shapeRotationType="0" shapeBorderWidthMapUnitScale="0,0,0,0,0,0" shapeRadiiMapUnitScale="0,0,0,0,0,0" shapeRadiiUnits="1"/>
          <shadow shadowOffsetMapUnitScale="0,0,0,0,0,0" shadowOffsetGlobal="1" shadowRadiusUnits="1" shadowTransparency="30" shadowColor="0,0,0,255" shadowUnder="0" shadowScale="100" shadowOffsetDist="1" shadowDraw="0" shadowOffsetAngle="135" shadowRadius="1,5" shadowRadiusMapUnitScale="0,0,0,0,0,0" shadowBlendMode="6" shadowRadiusAlphaOnly="0" shadowOffsetUnits="1"/>
          <placement repeatDistanceUnit="1" placement="2" maxCurvedCharAngleIn="20" repeatDistance="0" distInMapUnits="0" labelOffsetInMapUnits="1" xOffset="0" distMapUnitScale="0,0,0,0,0,0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" preserveRotation="1" repeatDistanceMapUnitScale="0,0,0,0,0,0" centroidWhole="0" priority="5" yOffset="0" offsetType="0" placementFlags="14" centroidInside="0" dist="1" angleOffset="0" maxCurvedCharAngleOut="-20" fitInPolygonOnly="0" quadOffset="4" labelOffsetMapUnitScale="0,0,0,0,0,0"/>
          <rendering fontMinPixelSize="3" scaleMax="10000000" fontMaxPixelSize="10000" scaleMin="1" upsidedownLabels="0" limitNumLabels="0" obstacle="1" obstacleFactor="1" scaleVisibility="0" fontLimitPixelSize="0" mergeLines="0" obstacleType="0" labelPerPart="0" zIndex="0" maxNumLabels="2000" displayAll="0" minFeatureSize="8"/>
          <data-defined>
            <Show expr="" field="label_1_visible" active="true" useExpr="false"/>
            <AlwaysShow expr="CASE WHEN  &quot;label_1_visible&quot; = 2 THEN 1 ELSE 0 END" field="" active="true" useExpr="true"/>
          </data-defined>
        </settings>
      </rule>
      <rule scalemaxdenom="501" description="Année" key="{4e3b5f89-3eb2-4bec-907b-46e1ff342709}" scalemindenom="1">
        <settings>
          <text-style fontItalic="0" fontFamily="Lato" fontLetterSpacing="0" fontUnderline="0" fontWeight="50" fontStrikeout="0" textTransp="0" previewBkgrdColor="#ffffff" fontCapitals="0" textColor="0,80,255,255" fontSizeInMapUnits="0" isExpression="1" blendMode="0" fontSizeMapUnitScale="0,0,0,0,0,0" fontSize="8" fieldName="' '  ||&quot;year&quot;  ||' ' " namedStyle="Regular" fontWordSpacing="0" useSubstitutions="0">
            <substitutions/>
          </text-style>
          <text-format placeDirectionSymbol="0" multilineAlign="0" rightDirectionSymbol=">" multilineHeight="1" plussign="0" addDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0" decimals="3" wrapChar="" reverseDirectionSymbol="0"/>
          <text-buffer bufferSize="1" bufferSizeMapUnitScale="0,0,0,0,0,0" bufferColor="255,255,255,255" bufferDraw="0" bufferBlendMode="0" bufferTransp="0" bufferSizeInMapUnits="0" bufferNoFill="0" bufferJoinStyle="64"/>
          <background shapeSizeUnits="1" shapeType="0" shapeSVGFile="" shapeOffsetX="0" shapeOffsetY="0" shapeBlendMode="0" shapeFillColor="255,255,255,255" shapeTransparency="0" shapeSizeMapUnitScale="0,0,0,0,0,0" shapeSizeType="0" shapeJoinStyle="64" shapeDraw="0" shapeBorderWidthUnits="1" shapeSizeX="0" shapeSizeY="0" shapeOffsetMapUnitScale="0,0,0,0,0,0" shapeRadiiX="0" shapeRadiiY="0" shapeOffsetUnits="1" shapeRotation="0" shapeBorderWidth="0" shapeBorderColor="128,128,128,255" shapeRotationType="0" shapeBorderWidthMapUnitScale="0,0,0,0,0,0" shapeRadiiMapUnitScale="0,0,0,0,0,0" shapeRadiiUnits="1"/>
          <shadow shadowOffsetMapUnitScale="0,0,0,0,0,0" shadowOffsetGlobal="1" shadowRadiusUnits="1" shadowTransparency="30" shadowColor="0,0,0,255" shadowUnder="0" shadowScale="100" shadowOffsetDist="1" shadowDraw="0" shadowOffsetAngle="135" shadowRadius="1,5" shadowRadiusMapUnitScale="0,0,0,0,0,0" shadowBlendMode="6" shadowRadiusAlphaOnly="0" shadowOffsetUnits="1"/>
          <placement repeatDistanceUnit="1" placement="2" maxCurvedCharAngleIn="20" repeatDistance="0" distInMapUnits="0" labelOffsetInMapUnits="1" xOffset="0" distMapUnitScale="0,0,0,0,0,0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" preserveRotation="1" repeatDistanceMapUnitScale="0,0,0,0,0,0" centroidWhole="0" priority="5" yOffset="0" offsetType="0" placementFlags="14" centroidInside="0" dist="1" angleOffset="0" maxCurvedCharAngleOut="-20" fitInPolygonOnly="0" quadOffset="4" labelOffsetMapUnitScale="0,0,0,0,0,0"/>
          <rendering fontMinPixelSize="3" scaleMax="10000000" fontMaxPixelSize="10000" scaleMin="1" upsidedownLabels="0" limitNumLabels="0" obstacle="1" obstacleFactor="1" scaleVisibility="0" fontLimitPixelSize="0" mergeLines="0" obstacleType="0" labelPerPart="0" zIndex="2" maxNumLabels="2000" displayAll="0" minFeatureSize="10"/>
          <data-defined>
            <Show expr="" field="label_1_visible" active="true" useExpr="false"/>
            <AlwaysShow expr="CASE WHEN  &quot;label_1_visible&quot; = 2 THEN 1 ELSE 0 END" field="" active="true" useExpr="true"/>
          </data-defined>
        </settings>
      </rule>
      <rule scalemaxdenom="1501" description="Protection" key="{d5e4c0db-d5b7-45d7-bf73-a07fd4e982e5}" scalemindenom="1">
        <settings>
          <text-style fontItalic="0" fontFamily="Lato" fontLetterSpacing="0" fontUnderline="0" fontWeight="50" fontStrikeout="0" textTransp="0" previewBkgrdColor="#ffffff" fontCapitals="0" textColor="0,80,255,255" fontSizeInMapUnits="0" isExpression="0" blendMode="0" fontSizeMapUnitScale="0,0,0,0,0,0" fontSize="8" fieldName="pipe_protection_value_fr" namedStyle="Regular" fontWordSpacing="0" useSubstitutions="0">
            <substitutions/>
          </text-style>
          <text-format placeDirectionSymbol="0" multilineAlign="0" rightDirectionSymbol=">" multilineHeight="1" plussign="0" addDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0" decimals="3" wrapChar="" reverseDirectionSymbol="0"/>
          <text-buffer bufferSize="1" bufferSizeMapUnitScale="0,0,0,0,0,0" bufferColor="255,255,255,255" bufferDraw="0" bufferBlendMode="0" bufferTransp="0" bufferSizeInMapUnits="0" bufferNoFill="0" bufferJoinStyle="64"/>
          <background shapeSizeUnits="1" shapeType="0" shapeSVGFile="" shapeOffsetX="0" shapeOffsetY="0" shapeBlendMode="0" shapeFillColor="255,255,255,255" shapeTransparency="0" shapeSizeMapUnitScale="0,0,0,0,0,0" shapeSizeType="0" shapeJoinStyle="64" shapeDraw="0" shapeBorderWidthUnits="1" shapeSizeX="0" shapeSizeY="0" shapeOffsetMapUnitScale="0,0,0,0,0,0" shapeRadiiX="0" shapeRadiiY="0" shapeOffsetUnits="1" shapeRotation="0" shapeBorderWidth="0" shapeBorderColor="128,128,128,255" shapeRotationType="0" shapeBorderWidthMapUnitScale="0,0,0,0,0,0" shapeRadiiMapUnitScale="0,0,0,0,0,0" shapeRadiiUnits="1"/>
          <shadow shadowOffsetMapUnitScale="0,0,0,0,0,0" shadowOffsetGlobal="1" shadowRadiusUnits="1" shadowTransparency="30" shadowColor="0,0,0,255" shadowUnder="0" shadowScale="100" shadowOffsetDist="1" shadowDraw="0" shadowOffsetAngle="135" shadowRadius="1,5" shadowRadiusMapUnitScale="0,0,0,0,0,0" shadowBlendMode="6" shadowRadiusAlphaOnly="0" shadowOffsetUnits="1"/>
          <placement repeatDistanceUnit="1" placement="2" maxCurvedCharAngleIn="20" repeatDistance="0" distInMapUnits="0" labelOffsetInMapUnits="1" xOffset="0" distMapUnitScale="0,0,0,0,0,0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" preserveRotation="1" repeatDistanceMapUnitScale="0,0,0,0,0,0" centroidWhole="0" priority="5" yOffset="0" offsetType="0" placementFlags="14" centroidInside="0" dist="1" angleOffset="0" maxCurvedCharAngleOut="-20" fitInPolygonOnly="0" quadOffset="4" labelOffsetMapUnitScale="0,0,0,0,0,0"/>
          <rendering fontMinPixelSize="3" scaleMax="10000000" fontMaxPixelSize="10000" scaleMin="1" upsidedownLabels="0" limitNumLabels="0" obstacle="1" obstacleFactor="1" scaleVisibility="0" fontLimitPixelSize="0" mergeLines="0" obstacleType="0" labelPerPart="0" zIndex="0" maxNumLabels="2000" displayAll="0" minFeatureSize="10"/>
          <data-defined>
            <Show expr="" field="label_1_visible" active="true" useExpr="false"/>
            <AlwaysShow expr="CASE WHEN  &quot;label_1_visible&quot; = 2 THEN 1 ELSE 0 END" field="" active="true" useExpr="true"/>
          </data-defined>
        </settings>
      </rule>
      <rule scalemaxdenom="3000" description="Remarque" key="{76c7585b-9e9d-473e-86df-6b42a78d557a}" scalemindenom="1">
        <settings>
          <text-style fontItalic="0" fontFamily="Lato" fontLetterSpacing="0" fontUnderline="0" fontWeight="50" fontStrikeout="0" textTransp="0" previewBkgrdColor="#ffffff" fontCapitals="0" textColor="0,80,255,255" fontSizeInMapUnits="0" isExpression="0" blendMode="0" fontSizeMapUnitScale="0,0,0,0,0,0" fontSize="8" fieldName="remark" namedStyle="Regular" fontWordSpacing="0" useSubstitutions="0">
            <substitutions/>
          </text-style>
          <text-format placeDirectionSymbol="0" multilineAlign="0" rightDirectionSymbol=">" multilineHeight="1" plussign="0" addDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0" decimals="3" wrapChar="" reverseDirectionSymbol="0"/>
          <text-buffer bufferSize="1" bufferSizeMapUnitScale="0,0,0,0,0,0" bufferColor="255,255,255,255" bufferDraw="0" bufferBlendMode="0" bufferTransp="0" bufferSizeInMapUnits="0" bufferNoFill="0" bufferJoinStyle="64"/>
          <background shapeSizeUnits="1" shapeType="0" shapeSVGFile="" shapeOffsetX="0" shapeOffsetY="0" shapeBlendMode="0" shapeFillColor="255,255,255,255" shapeTransparency="0" shapeSizeMapUnitScale="0,0,0,0,0,0" shapeSizeType="0" shapeJoinStyle="64" shapeDraw="0" shapeBorderWidthUnits="1" shapeSizeX="0" shapeSizeY="0" shapeOffsetMapUnitScale="0,0,0,0,0,0" shapeRadiiX="0" shapeRadiiY="0" shapeOffsetUnits="1" shapeRotation="0" shapeBorderWidth="0" shapeBorderColor="128,128,128,255" shapeRotationType="0" shapeBorderWidthMapUnitScale="0,0,0,0,0,0" shapeRadiiMapUnitScale="0,0,0,0,0,0" shapeRadiiUnits="1"/>
          <shadow shadowOffsetMapUnitScale="0,0,0,0,0,0" shadowOffsetGlobal="1" shadowRadiusUnits="1" shadowTransparency="30" shadowColor="0,0,0,255" shadowUnder="0" shadowScale="100" shadowOffsetDist="1" shadowDraw="0" shadowOffsetAngle="135" shadowRadius="1,5" shadowRadiusMapUnitScale="0,0,0,0,0,0" shadowBlendMode="6" shadowRadiusAlphaOnly="0" shadowOffsetUnits="1"/>
          <placement repeatDistanceUnit="1" placement="2" maxCurvedCharAngleIn="20" repeatDistance="0" distInMapUnits="0" labelOffsetInMapUnits="1" xOffset="0" distMapUnitScale="0,0,0,0,0,0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" preserveRotation="1" repeatDistanceMapUnitScale="0,0,0,0,0,0" centroidWhole="0" priority="5" yOffset="0" offsetType="0" placementFlags="14" centroidInside="0" dist="1" angleOffset="0" maxCurvedCharAngleOut="-20" fitInPolygonOnly="0" quadOffset="4" labelOffsetMapUnitScale="0,0,0,0,0,0"/>
          <rendering fontMinPixelSize="3" scaleMax="10000000" fontMaxPixelSize="10000" scaleMin="1" upsidedownLabels="0" limitNumLabels="0" obstacle="1" obstacleFactor="1" scaleVisibility="0" fontLimitPixelSize="0" mergeLines="0" obstacleType="0" labelPerPart="0" zIndex="0" maxNumLabels="2000" displayAll="0" minFeatureSize="10"/>
          <data-defined>
            <Show expr="" field="label_1_visible" active="true" useExpr="false"/>
            <AlwaysShow expr="CASE WHEN  &quot;label_1_visible&quot; = 2 THEN 1 ELSE 0 END" field="" active="true" useExpr="true"/>
          </data-defined>
        </settings>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property key="LinkIt_destinationField" value="fk_parent"/>
    <property key="LinkIt_name" value="Conduites parent"/>
    <property key="LinkIt_sourceLayer" value="conduites_copy20130709141244955"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="itemBrowserCurrentItem" value="-1"/>
    <property key="itemBrowserSelection" value="[]"/>
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
    <property key="labeling/drawLabels" value="true"/>
    <property key="labeling/enabled" value="true"/>
    <property key="labeling/fieldName" value=" replace( &quot;pipe_material_short_fr&quot;||' ','Inconnu ','')&#xa; ||&#xa; &quot;pipe_material_diameter&quot;&#xa; ||&#xa; CASE&#xa;WHEN  $scale  &lt; 501  AND  $length > 4 AND  &quot;fk_precision&quot; IN (1101,1103,1105) THEN ' imprécis'&#xa; ELSE ''&#xa; END&#xa;||&#xa; CASE&#xa;WHEN  $scale  &lt; 501  AND  $length > 4 THEN COALESCE('\n' ||&quot;year&quot;,'')&#xa;WHEN  $scale  >= 1000 THEN COALESCE(' ' ||&quot;year&quot;,'')&#xa; ELSE ''&#xa; END&#xa;||&#xa;CASE&#xa;WHEN  $scale  &lt;= 3000 THEN  COALESCE('\n'||  &quot;pipe_protection_value_fr&quot;, '')&#xa; ELSE ''&#xa;END&#xa;||&#xa;CASE&#xa;WHEN  $scale  &lt;= 6000  THEN  COALESCE(' ' ||&quot;label_1_text&quot;,'')&#xa; ELSE ''&#xa;END"/>
    <property key="labeling/fitInPolygonOnly" value="false"/>
    <property key="labeling/fontBold" value="false"/>
    <property key="labeling/fontCapitals" value="0"/>
    <property key="labeling/fontFamily" value="Arial"/>
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
    <property key="labeling/obstacleFactor" value="1"/>
    <property key="labeling/obstacleType" value="0"/>
    <property key="labeling/offsetType" value="0"/>
    <property key="labeling/placeDirectionSymbol" value="0"/>
    <property key="labeling/placement" value="2"/>
    <property key="labeling/placementFlags" value="14"/>
    <property key="labeling/plussign" value="false"/>
    <property key="labeling/predefinedPositionOrder" value="TR,TL,BR,BL,R,L,TSR,BSR"/>
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
    <property key="labeling/zIndex" value="0"/>
    <property key="variableNames" value="_fields_"/>
    <property key="variableValues" value=""/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerTransparency>0</layerTransparency>
  <displayfield>pressurezone_name</displayfield>
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
  <SingleCategoryDiagramRenderer diagramType="Pie" sizeLegend="0" attributeLegend="1">
    <DiagramCategory penColor="#000000" labelPlacementMethod="XHeight" penWidth="0" diagramOrientation="Up" sizeScale="0,0,0,0,0,0" minimumSize="0" barWidth="5" penAlpha="255" maxScaleDenominator="1e+08" backgroundColor="#ffffff" transparency="0" width="30" scaleDependency="Area" backgroundAlpha="255" angleOffset="1440" scaleBasedVisibility="0" enabled="1" height="30" lineSizeScale="0,0,0,0,0,0" sizeType="MM" lineSizeType="MM" minScaleDenominator="100000">
      <fontProperties description="Cantarell,11,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
    <symbol alpha="1" clip_to_extent="1" type="marker" name="sizeSymbol">
      <layer pass="0" class="SimpleMarker" locked="0">
        <prop k="angle" v="0"/>
        <prop k="color" v="255,0,0,255"/>
        <prop k="horizontal_anchor_point" v="1"/>
        <prop k="joinstyle" v="bevel"/>
        <prop k="name" v="circle"/>
        <prop k="offset" v="0,0"/>
        <prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
        <prop k="offset_unit" v="MM"/>
        <prop k="outline_color" v="0,0,0,255"/>
        <prop k="outline_style" v="solid"/>
        <prop k="outline_width" v="0"/>
        <prop k="outline_width_map_unit_scale" v="0,0,0,0,0,0"/>
        <prop k="outline_width_unit" v="MM"/>
        <prop k="scale_method" v="diameter"/>
        <prop k="size" v="2"/>
        <prop k="size_map_unit_scale" v="0,0,0,0,0,0"/>
        <prop k="size_unit" v="MM"/>
        <prop k="vertical_anchor_point" v="1"/>
      </layer>
    </symbol>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings yPosColumn="-1" showColumn="0" linePlacementFlags="1" placement="0" dist="0" xPosColumn="-1" priority="0" obstacle="0" zIndex="0" showAll="0"/>
  <annotationform>.</annotationform>
  <aliases>
    <alias field="id" index="0" name=""/>
    <alias field="fk_parent" index="1" name="Parent"/>
    <alias field="fk_function" index="2" name="Fonction"/>
    <alias field="fk_installmethod" index="3" name="Mode de pose"/>
    <alias field="fk_material" index="4" name="Matériau"/>
    <alias field="fk_distributor" index="5" name="Distributeur"/>
    <alias field="fk_precision" index="6" name="Précision"/>
    <alias field="fk_bedding" index="7" name="Lit de pose"/>
    <alias field="fk_protection" index="8" name="Protection"/>
    <alias field="fk_status" index="9" name="Statut"/>
    <alias field="fk_watertype" index="10" name="Eau"/>
    <alias field="fk_locationtype" index="11" name="Localisation"/>
    <alias field="fk_folder" index="12" name="Dossier technique"/>
    <alias field="year" index="13" name="Année"/>
    <alias field="year_rehabilitation" index="14" name=""/>
    <alias field="year_end" index="15" name="Année fin"/>
    <alias field="tunnel_or_bridge" index="16" name="Tunnel ou pont"/>
    <alias field="pressure_nominal" index="17" name=""/>
    <alias field="remark" index="18" name="Remarque"/>
    <alias field="_valve_count" index="19" name="Nombre de vanne"/>
    <alias field="_valve_closed" index="20" name="Fermée par vanne"/>
    <alias field="schema_force_visible" index="21" name="Visiblité schématique"/>
    <alias field="label_1_visible" index="22" name=""/>
    <alias field="label_1_text" index="23" name=""/>
    <alias field="label_2_visible" index="24" name=""/>
    <alias field="label_2_text" index="25" name=""/>
    <alias field="fk_node_a" index="26" name=""/>
    <alias field="fk_node_b" index="27" name=""/>
    <alias field="fk_district" index="28" name="Commune"/>
    <alias field="fk_pressurezone" index="29" name="Zone de pression"/>
    <alias field="fk_printmap" index="30" name="Folio"/>
    <alias field="_length2d" index="31" name=""/>
    <alias field="_length3d" index="32" name=""/>
    <alias field="_diff_elevation" index="33" name=""/>
    <alias field="_printmaps" index="34" name=""/>
    <alias field="_geometry_alt1_used" index="35" name=""/>
    <alias field="_geometry_alt2_used" index="36" name=""/>
    <alias field="update_geometry_alt1" index="37" name=""/>
    <alias field="update_geometry_alt2" index="38" name=""/>
    <alias field="geometry_alt1" index="39" name=""/>
    <alias field="geometry_alt2" index="40" name=""/>
    <alias field="pipe_function_value_fr" index="41" name=""/>
    <alias field="pipe_function_value_en" index="42" name=""/>
    <alias field="pipe_function_value_ro" index="43" name=""/>
    <alias field="pipe_function_schema_visible" index="44" name=""/>
    <alias field="pipe_function_major" index="45" name=""/>
    <alias field="pipe_protection_value_fr" index="46" name=""/>
    <alias field="pipe_protection_value_en" index="47" name=""/>
    <alias field="pipe_protection_value_ro" index="48" name=""/>
    <alias field="pressurezone_name" index="49" name=""/>
    <alias field="pressurezone_colorcode" index="50" name=""/>
    <alias field="pipe_material_short_fr" index="51" name=""/>
    <alias field="pipe_material_short_en" index="52" name=""/>
    <alias field="pipe_material_short_ro" index="53" name=""/>
    <alias field="pipe_material_value_fr" index="54" name=""/>
    <alias field="pipe_material_value_en" index="55" name=""/>
    <alias field="pipe_material_value_ro" index="56" name=""/>
    <alias field="pipe_material__displayname_fr" index="57" name=""/>
    <alias field="pipe_material__displayname_en" index="58" name=""/>
    <alias field="pipe_material__displayname_ro" index="59" name=""/>
    <alias field="pipe_material_diameter" index="60" name=""/>
    <alias field="pipe_material_diameter_nominal" index="61" name=""/>
    <alias field="pipe_material_diameter_external" index="62" name=""/>
    <alias field="status_value_fr" index="63" name=""/>
    <alias field="status_value_en" index="64" name=""/>
    <alias field="status_value_ro" index="65" name=""/>
    <alias field="status_active" index="66" name=""/>
    <alias field="__schema_visible" index="67" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <attributeactions default="0">
    <actionsetting showInAttributeTable="1" action="qgis.utils.plugins['postgres91plusauditor'].audit('pipe20130507153818274',[% $id %])" icon="" capture="0" type="1" name="History audit" shortTitle=""/>
    <actionsetting showInAttributeTable="1" action="qgis.utils.plugins['linkit'].linkit('conduites_copy20130709141244955','fk_parent','conduites_copy20130709141244955', [% $id %])" icon="" capture="0" type="1" name="Conduites parent" shortTitle=""/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column width="-1" hidden="0" type="field" name="id"/>
      <column width="-1" hidden="0" type="field" name="fk_parent"/>
      <column width="-1" hidden="0" type="field" name="fk_function"/>
      <column width="-1" hidden="0" type="field" name="fk_installmethod"/>
      <column width="256" hidden="0" type="field" name="fk_material"/>
      <column width="-1" hidden="0" type="field" name="fk_distributor"/>
      <column width="-1" hidden="0" type="field" name="fk_precision"/>
      <column width="-1" hidden="0" type="field" name="fk_bedding"/>
      <column width="-1" hidden="0" type="field" name="fk_protection"/>
      <column width="-1" hidden="0" type="field" name="fk_status"/>
      <column width="-1" hidden="0" type="field" name="fk_watertype"/>
      <column width="-1" hidden="0" type="field" name="fk_locationtype"/>
      <column width="-1" hidden="0" type="field" name="fk_folder"/>
      <column width="-1" hidden="0" type="field" name="year"/>
      <column width="-1" hidden="0" type="field" name="year_end"/>
      <column width="-1" hidden="0" type="field" name="tunnel_or_bridge"/>
      <column width="-1" hidden="0" type="field" name="pressure_nominal"/>
      <column width="-1" hidden="0" type="field" name="remark"/>
      <column width="-1" hidden="0" type="field" name="_valve_count"/>
      <column width="-1" hidden="0" type="field" name="_valve_closed"/>
      <column width="-1" hidden="0" type="field" name="schema_force_visible"/>
      <column width="-1" hidden="0" type="field" name="label_1_visible"/>
      <column width="-1" hidden="0" type="field" name="label_1_text"/>
      <column width="-1" hidden="0" type="field" name="label_2_visible"/>
      <column width="-1" hidden="0" type="field" name="label_2_text"/>
      <column width="-1" hidden="0" type="field" name="fk_node_a"/>
      <column width="-1" hidden="0" type="field" name="fk_node_b"/>
      <column width="-1" hidden="0" type="field" name="fk_district"/>
      <column width="-1" hidden="0" type="field" name="fk_pressurezone"/>
      <column width="-1" hidden="0" type="field" name="fk_printmap"/>
      <column width="-1" hidden="0" type="field" name="_length2d"/>
      <column width="-1" hidden="0" type="field" name="_length3d"/>
      <column width="-1" hidden="0" type="field" name="_diff_elevation"/>
      <column width="-1" hidden="0" type="field" name="_printmaps"/>
      <column width="-1" hidden="0" type="field" name="_geometry_alt1_used"/>
      <column width="-1" hidden="0" type="field" name="_geometry_alt2_used"/>
      <column width="-1" hidden="0" type="field" name="geometry_alt1"/>
      <column width="-1" hidden="0" type="field" name="geometry_alt2"/>
      <column width="-1" hidden="0" type="field" name="year_rehabilitation"/>
      <column width="-1" hidden="0" type="field" name="update_geometry_alt1"/>
      <column width="-1" hidden="0" type="field" name="update_geometry_alt2"/>
      <column width="-1" hidden="0" type="field" name="pipe_function_value_fr"/>
      <column width="-1" hidden="0" type="field" name="pipe_function_value_en"/>
      <column width="-1" hidden="0" type="field" name="pipe_function_value_ro"/>
      <column width="-1" hidden="0" type="field" name="pipe_function_schema_visible"/>
      <column width="-1" hidden="0" type="field" name="pipe_function_major"/>
      <column width="-1" hidden="0" type="field" name="pipe_protection_value_fr"/>
      <column width="-1" hidden="0" type="field" name="pipe_protection_value_en"/>
      <column width="-1" hidden="0" type="field" name="pipe_protection_value_ro"/>
      <column width="-1" hidden="0" type="field" name="pressurezone_name"/>
      <column width="-1" hidden="0" type="field" name="pressurezone_colorcode"/>
      <column width="-1" hidden="0" type="field" name="pipe_material_short_fr"/>
      <column width="-1" hidden="0" type="field" name="pipe_material_short_en"/>
      <column width="-1" hidden="0" type="field" name="pipe_material_short_ro"/>
      <column width="-1" hidden="0" type="field" name="pipe_material_value_fr"/>
      <column width="-1" hidden="0" type="field" name="pipe_material_value_en"/>
      <column width="-1" hidden="0" type="field" name="pipe_material_value_ro"/>
      <column width="-1" hidden="0" type="field" name="pipe_material__displayname_fr"/>
      <column width="-1" hidden="0" type="field" name="pipe_material__displayname_en"/>
      <column width="-1" hidden="0" type="field" name="pipe_material__displayname_ro"/>
      <column width="-1" hidden="0" type="field" name="pipe_material_diameter"/>
      <column width="-1" hidden="0" type="field" name="pipe_material_diameter_nominal"/>
      <column width="-1" hidden="0" type="field" name="pipe_material_diameter_external"/>
      <column width="-1" hidden="0" type="field" name="status_value_fr"/>
      <column width="-1" hidden="0" type="field" name="status_value_en"/>
      <column width="-1" hidden="0" type="field" name="status_value_ro"/>
      <column width="-1" hidden="0" type="field" name="status_active"/>
      <column width="-1" hidden="0" type="field" name="__schema_visible"/>
      <column width="-1" hidden="1" type="actions"/>
    </columns>
  </attributetableconfig>
  <editform>./ui_forms/pipe.ui</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>.</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from PyQt4.QtGui import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>uifilelayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer showLabel="1" visibilityExpressionEnabled="0" visibilityExpression="" name="Général" groupBox="0" columnCount="1">
      <attributeEditorField showLabel="1" index="0" name="id"/>
      <attributeEditorField showLabel="1" index="5" name="fk_distributor"/>
      <attributeEditorField showLabel="1" index="12" name="fk_folder"/>
      <attributeEditorField showLabel="1" index="13" name="year"/>
      <attributeEditorField showLabel="1" index="14" name="year_rehabilitation"/>
      <attributeEditorField showLabel="1" index="15" name="year_end"/>
    </attributeEditorContainer>
    <attributeEditorField showLabel="1" index="18" name="remark"/>
  </attributeEditorForm>
  <widgets>
    <widget name="relation_pipe_leak">
      <config/>
    </widget>
    <widget name="relation_pipe_meter">
      <config/>
    </widget>
    <widget name="relation_pipe_parent">
      <config/>
    </widget>
    <widget name="relation_pipe_subscriber">
      <config/>
    </widget>
    <widget name="relation_pump_pipe_in">
      <config/>
    </widget>
    <widget name="relation_pump_pipe_out">
      <config/>
    </widget>
    <widget name="relation_valve_pipe">
      <config/>
    </widget>
  </widgets>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <layerGeometryType>1</layerGeometryType>
</qgis>
