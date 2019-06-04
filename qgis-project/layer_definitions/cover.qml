<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyAlgorithm="0" maxScale="0" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" styleCategories="AllStyleCategories" version="3.4.7-Madeira" minScale="1e+08" labelsEnabled="0" simplifyLocal="1" simplifyDrawingHints="0" simplifyMaxScale="1" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="RuleRenderer" forceraster="0" enableorderby="0" symbollevels="0">
    <rules key="{99308dc6-545d-410d-bf91-facc3f952028}">
      <rule symbol="0" key="{6b84601d-0034-4793-9b90-388447715e50}" filter="circular= 'false'" label="Rectangulaire"/>
      <rule symbol="1" key="{8efb24f5-2b00-41cc-811b-0bb6a1995bb5}" filter="circular= 'true'" label="Circulaire"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="0">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="234,233,232,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="square" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.4" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="1">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="234,233,232,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.4" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <effect enabled="0" type="effectStack">
      <effect type="drawSource">
        <prop v="0" k="blend_mode"/>
        <prop v="2" k="draw_mode"/>
        <prop v="1" k="enabled"/>
        <prop v="1" k="opacity"/>
      </effect>
    </effect>
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>id</value>
    </property>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory backgroundAlpha="255" penColor="#000000" maxScaleDenominator="1e+08" height="15" minScaleDenominator="0" penAlpha="255" opacity="1" sizeType="MM" barWidth="5" scaleDependency="Area" width="15" minimumSize="0" lineSizeScale="3x:0,0,0,0,0,0" diagramOrientation="Up" lineSizeType="MM" sizeScale="3x:0,0,0,0,0,0" rotationOffset="270" labelPlacementMethod="XHeight" enabled="0" scaleBasedVisibility="0" penWidth="0" backgroundColor="#ffffff">
      <fontProperties description="Lato,10,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" priority="0" zIndex="0" obstacle="0" linePlacementFlags="2" showAll="1" placement="0">
    <properties>
      <Option type="Map">
        <Option value="" type="QString" name="name"/>
        <Option name="properties"/>
        <Option value="collection" type="QString" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="identification">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_distributor">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="distributor20130304114719702" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="name" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_status">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_status20130304110011436" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_cover_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_cover_type20141219115626290" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_installation">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowAddFeatures"/>
            <Option value="true" type="bool" name="AllowNULL"/>
            <Option value="true" type="bool" name="MapIdentification"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="true" type="bool" name="ReadOnly"/>
            <Option value="relation_cover_installation" type="QString" name="Relation"/>
            <Option value="false" type="bool" name="ShowForm"/>
            <Option value="true" type="bool" name="ShowOpenFormButton"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="year">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="allow_null"/>
            <Option value="true" type="bool" name="calendar_popup"/>
            <Option value="yyyy" type="QString" name="display_format"/>
            <Option value="yyyy" type="QString" name="field_format"/>
            <Option value="false" type="bool" name="field_iso_format"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="altitude">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="circular">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="form_dimension">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="remark">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geometry_polygon">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_rotation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_text">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_rotation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_text">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_precision">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_precisionalti">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_object_reference">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" index="0" name="ID"/>
    <alias field="identification" index="1" name="Identification"/>
    <alias field="fk_distributor" index="2" name="Distributeur"/>
    <alias field="fk_status" index="3" name="Statut"/>
    <alias field="fk_cover_type" index="4" name="Type"/>
    <alias field="fk_installation" index="5" name="Ouvrage"/>
    <alias field="year" index="6" name="Année"/>
    <alias field="altitude" index="7" name=""/>
    <alias field="circular" index="8" name="Circulaire"/>
    <alias field="form_dimension" index="9" name="Diamètre"/>
    <alias field="remark" index="10" name="Commentaire"/>
    <alias field="geometry_polygon" index="11" name=""/>
    <alias field="label_1_visible" index="12" name=""/>
    <alias field="label_1_x" index="13" name=""/>
    <alias field="label_1_y" index="14" name=""/>
    <alias field="label_1_rotation" index="15" name=""/>
    <alias field="label_1_text" index="16" name=""/>
    <alias field="label_2_visible" index="17" name=""/>
    <alias field="label_2_x" index="18" name=""/>
    <alias field="label_2_y" index="19" name=""/>
    <alias field="label_2_rotation" index="20" name=""/>
    <alias field="label_2_text" index="21" name=""/>
    <alias field="fk_precision" index="22" name=""/>
    <alias field="fk_precisionalti" index="23" name=""/>
    <alias field="fk_object_reference" index="24" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="identification" expression="" applyOnUpdate="0"/>
    <default field="fk_distributor" expression="" applyOnUpdate="0"/>
    <default field="fk_status" expression="" applyOnUpdate="0"/>
    <default field="fk_cover_type" expression="" applyOnUpdate="0"/>
    <default field="fk_installation" expression="" applyOnUpdate="0"/>
    <default field="year" expression="" applyOnUpdate="0"/>
    <default field="altitude" expression="" applyOnUpdate="0"/>
    <default field="circular" expression="" applyOnUpdate="0"/>
    <default field="form_dimension" expression="" applyOnUpdate="0"/>
    <default field="remark" expression="" applyOnUpdate="0"/>
    <default field="geometry_polygon" expression="" applyOnUpdate="0"/>
    <default field="label_1_visible" expression="" applyOnUpdate="0"/>
    <default field="label_1_x" expression="" applyOnUpdate="0"/>
    <default field="label_1_y" expression="" applyOnUpdate="0"/>
    <default field="label_1_rotation" expression="" applyOnUpdate="0"/>
    <default field="label_1_text" expression="" applyOnUpdate="0"/>
    <default field="label_2_visible" expression="" applyOnUpdate="0"/>
    <default field="label_2_x" expression="" applyOnUpdate="0"/>
    <default field="label_2_y" expression="" applyOnUpdate="0"/>
    <default field="label_2_rotation" expression="" applyOnUpdate="0"/>
    <default field="label_2_text" expression="" applyOnUpdate="0"/>
    <default field="fk_precision" expression="" applyOnUpdate="0"/>
    <default field="fk_precisionalti" expression="" applyOnUpdate="0"/>
    <default field="fk_object_reference" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="id" notnull_strength="1" unique_strength="1" exp_strength="0" constraints="3"/>
    <constraint field="identification" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_distributor" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_status" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_cover_type" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_installation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="year" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="altitude" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="circular" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="form_dimension" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="remark" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="geometry_polygon" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_1_visible" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_1_x" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_1_y" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_1_rotation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_1_text" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_2_visible" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_2_x" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_2_y" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_2_rotation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_2_text" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_precision" notnull_strength="1" unique_strength="0" exp_strength="0" constraints="1"/>
    <constraint field="fk_precisionalti" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_object_reference" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" exp="" desc=""/>
    <constraint field="identification" exp="" desc=""/>
    <constraint field="fk_distributor" exp="" desc=""/>
    <constraint field="fk_status" exp="" desc=""/>
    <constraint field="fk_cover_type" exp="" desc=""/>
    <constraint field="fk_installation" exp="" desc=""/>
    <constraint field="year" exp="" desc=""/>
    <constraint field="altitude" exp="" desc=""/>
    <constraint field="circular" exp="" desc=""/>
    <constraint field="form_dimension" exp="" desc=""/>
    <constraint field="remark" exp="" desc=""/>
    <constraint field="geometry_polygon" exp="" desc=""/>
    <constraint field="label_1_visible" exp="" desc=""/>
    <constraint field="label_1_x" exp="" desc=""/>
    <constraint field="label_1_y" exp="" desc=""/>
    <constraint field="label_1_rotation" exp="" desc=""/>
    <constraint field="label_1_text" exp="" desc=""/>
    <constraint field="label_2_visible" exp="" desc=""/>
    <constraint field="label_2_x" exp="" desc=""/>
    <constraint field="label_2_y" exp="" desc=""/>
    <constraint field="label_2_rotation" exp="" desc=""/>
    <constraint field="label_2_text" exp="" desc=""/>
    <constraint field="fk_precision" exp="" desc=""/>
    <constraint field="fk_precisionalti" exp="" desc=""/>
    <constraint field="fk_object_reference" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
    <actionsetting capture="0" icon="" isEnabledOnlyWhenEditable="0" notificationMessage="" type="1" id="{71957eb9-ae96-48d7-b32c-2e69e3309de6}" name="History audit" shortTitle="" action="qgis.utils.plugins['postgres91plusauditor'].audit('od_cover20141219115626229',[% $id %])">
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" type="field" name="id" width="-1"/>
      <column hidden="0" type="field" name="identification" width="-1"/>
      <column hidden="0" type="field" name="fk_distributor" width="-1"/>
      <column hidden="0" type="field" name="fk_status" width="-1"/>
      <column hidden="0" type="field" name="fk_cover_type" width="-1"/>
      <column hidden="0" type="field" name="fk_installation" width="-1"/>
      <column hidden="0" type="field" name="year" width="-1"/>
      <column hidden="0" type="field" name="altitude" width="-1"/>
      <column hidden="0" type="field" name="circular" width="-1"/>
      <column hidden="0" type="field" name="form_dimension" width="-1"/>
      <column hidden="0" type="field" name="remark" width="-1"/>
      <column hidden="0" type="field" name="geometry_polygon" width="-1"/>
      <column hidden="0" type="field" name="label_1_visible" width="-1"/>
      <column hidden="0" type="field" name="label_1_x" width="-1"/>
      <column hidden="0" type="field" name="label_1_y" width="-1"/>
      <column hidden="0" type="field" name="label_1_rotation" width="-1"/>
      <column hidden="0" type="field" name="label_1_text" width="-1"/>
      <column hidden="0" type="field" name="label_2_visible" width="-1"/>
      <column hidden="0" type="field" name="label_2_x" width="-1"/>
      <column hidden="0" type="field" name="label_2_y" width="-1"/>
      <column hidden="0" type="field" name="label_2_rotation" width="-1"/>
      <column hidden="0" type="field" name="label_2_text" width="-1"/>
      <column hidden="1" type="actions" width="-1"/>
      <column hidden="0" type="field" name="fk_precision" width="-1"/>
      <column hidden="0" type="field" name="fk_precisionalti" width="-1"/>
      <column hidden="0" type="field" name="fk_object_reference" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">/home/lbartoletti/QWAT/qgis-project/ui_forms/cover.ui</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>/usr/home/lbartoletti/QWAT/qgis-project</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
Les formulaires QGIS peuvent avoir une fonction Python qui sera appelée à l'ouverture du formulaire.

Utilisez cette fonction pour ajouter plus de fonctionnalités à vos formulaires.

Entrez le nom de la fonction dans le champ "Fonction d'initialisation Python".
Voici un exemple à suivre:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
    geom = feature.geometry()
    control = dialog.findChild(QWidget, "MyLineEdit")

]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="2" visibilityExpression="" groupBox="0" name="Général" showLabel="1">
      <attributeEditorField index="0" name="id" showLabel="1"/>
      <attributeEditorField index="2" name="fk_distributor" showLabel="1"/>
      <attributeEditorField index="1" name="identification" showLabel="1"/>
      <attributeEditorField index="3" name="fk_status" showLabel="1"/>
      <attributeEditorField index="5" name="fk_installation" showLabel="1"/>
      <attributeEditorField index="4" name="fk_cover_type" showLabel="1"/>
      <attributeEditorField index="9" name="form_dimension" showLabel="1"/>
      <attributeEditorField index="6" name="year" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorField index="8" name="circular" showLabel="1"/>
    <attributeEditorField index="10" name="remark" showLabel="1"/>
  </attributeEditorForm>
  <editable>
    <field name="altitude" editable="1"/>
    <field name="circular" editable="1"/>
    <field name="fk_cover_type" editable="1"/>
    <field name="fk_distributor" editable="1"/>
    <field name="fk_installation" editable="1"/>
    <field name="fk_object_reference" editable="1"/>
    <field name="fk_precision" editable="1"/>
    <field name="fk_precisionalti" editable="1"/>
    <field name="fk_status" editable="1"/>
    <field name="form_dimension" editable="1"/>
    <field name="geometry_polygon" editable="1"/>
    <field name="id" editable="1"/>
    <field name="identification" editable="1"/>
    <field name="label_1_rotation" editable="1"/>
    <field name="label_1_text" editable="1"/>
    <field name="label_1_visible" editable="1"/>
    <field name="label_1_x" editable="1"/>
    <field name="label_1_y" editable="1"/>
    <field name="label_2_rotation" editable="1"/>
    <field name="label_2_text" editable="1"/>
    <field name="label_2_visible" editable="1"/>
    <field name="label_2_x" editable="1"/>
    <field name="label_2_y" editable="1"/>
    <field name="remark" editable="1"/>
    <field name="year" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="altitude" labelOnTop="0"/>
    <field name="circular" labelOnTop="0"/>
    <field name="fk_cover_type" labelOnTop="0"/>
    <field name="fk_distributor" labelOnTop="0"/>
    <field name="fk_installation" labelOnTop="0"/>
    <field name="fk_object_reference" labelOnTop="0"/>
    <field name="fk_precision" labelOnTop="0"/>
    <field name="fk_precisionalti" labelOnTop="0"/>
    <field name="fk_status" labelOnTop="0"/>
    <field name="form_dimension" labelOnTop="0"/>
    <field name="geometry_polygon" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="identification" labelOnTop="0"/>
    <field name="label_1_rotation" labelOnTop="0"/>
    <field name="label_1_text" labelOnTop="0"/>
    <field name="label_1_visible" labelOnTop="0"/>
    <field name="label_1_x" labelOnTop="0"/>
    <field name="label_1_y" labelOnTop="0"/>
    <field name="label_2_rotation" labelOnTop="0"/>
    <field name="label_2_text" labelOnTop="0"/>
    <field name="label_2_visible" labelOnTop="0"/>
    <field name="label_2_x" labelOnTop="0"/>
    <field name="label_2_y" labelOnTop="0"/>
    <field name="remark" labelOnTop="0"/>
    <field name="year" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
