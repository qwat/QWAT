<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" minScale="1e+08" simplifyLocal="1" labelsEnabled="0" simplifyMaxScale="1" simplifyDrawingHints="0" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" styleCategories="AllStyleCategories" simplifyDrawingTol="1" readOnly="0" version="3.4.7-Madeira">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="RuleRenderer" symbollevels="0" forceraster="0" enableorderby="0">
    <rules key="{99308dc6-545d-410d-bf91-facc3f952028}">
      <rule label="Rectangulaire" filter="circular= 'false'" symbol="0" key="{6b84601d-0034-4793-9b90-388447715e50}"/>
      <rule label="Circulaire" filter="circular= 'true'" symbol="1" key="{8efb24f5-2b00-41cc-811b-0bb6a1995bb5}"/>
    </rules>
    <symbols>
      <symbol force_rhr="0" name="0" type="marker" alpha="1" clip_to_extent="1">
        <layer pass="0" enabled="1" class="SimpleMarker" locked="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="234,233,232,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="square"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.4"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="opacity" v="1"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" name="1" type="marker" alpha="1" clip_to_extent="1">
        <layer pass="0" enabled="1" class="SimpleMarker" locked="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="234,233,232,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.4"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="opacity" v="1"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <effect enabled="0" type="effectStack">
      <effect type="drawSource">
        <prop k="blend_mode" v="0"/>
        <prop k="draw_mode" v="2"/>
        <prop k="enabled" v="1"/>
        <prop k="opacity" v="1"/>
      </effect>
    </effect>
  </renderer-v2>
  <customproperties>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory maxScaleDenominator="1e+08" width="15" penAlpha="255" minimumSize="0" diagramOrientation="Up" labelPlacementMethod="XHeight" sizeType="MM" penWidth="0" barWidth="5" scaleBasedVisibility="0" scaleDependency="Area" minScaleDenominator="0" enabled="0" backgroundColor="#ffffff" sizeScale="3x:0,0,0,0,0,0" backgroundAlpha="255" height="15" rotationOffset="270" penColor="#000000" lineSizeType="MM" lineSizeScale="3x:0,0,0,0,0,0" opacity="1">
      <fontProperties description="Lato,10,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" label="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" zIndex="0" showAll="1" linePlacementFlags="2" dist="0" obstacle="0" placement="0">
    <properties>
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties"/>
        <Option value="collection" name="type" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="identification">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_distributor">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" name="AllowMulti" type="bool"/>
            <Option value="false" name="AllowNull" type="bool"/>
            <Option value="" name="FilterExpression" type="QString"/>
            <Option value="id" name="Key" type="QString"/>
            <Option value="distributor20130304114719702" name="Layer" type="QString"/>
            <Option value="1" name="NofColumns" type="int"/>
            <Option value="false" name="OrderByValue" type="bool"/>
            <Option value="false" name="UseCompleter" type="bool"/>
            <Option value="name" name="Value" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_status">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" name="AllowMulti" type="bool"/>
            <Option value="false" name="AllowNull" type="bool"/>
            <Option value="" name="FilterExpression" type="QString"/>
            <Option value="id" name="Key" type="QString"/>
            <Option value="vl_status20130304110011436" name="Layer" type="QString"/>
            <Option value="1" name="NofColumns" type="int"/>
            <Option value="false" name="OrderByValue" type="bool"/>
            <Option value="false" name="UseCompleter" type="bool"/>
            <Option value="value_fr" name="Value" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_cover_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" name="AllowMulti" type="bool"/>
            <Option value="false" name="AllowNull" type="bool"/>
            <Option value="" name="FilterExpression" type="QString"/>
            <Option value="id" name="Key" type="QString"/>
            <Option value="vl_cover_type20141219115626290" name="Layer" type="QString"/>
            <Option value="1" name="NofColumns" type="int"/>
            <Option value="false" name="OrderByValue" type="bool"/>
            <Option value="false" name="UseCompleter" type="bool"/>
            <Option value="value_fr" name="Value" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_installation">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option value="false" name="AllowAddFeatures" type="bool"/>
            <Option value="true" name="AllowNULL" type="bool"/>
            <Option value="true" name="MapIdentification" type="bool"/>
            <Option value="false" name="OrderByValue" type="bool"/>
            <Option value="true" name="ReadOnly" type="bool"/>
            <Option value="relation_cover_installation" name="Relation" type="QString"/>
            <Option value="false" name="ShowForm" type="bool"/>
            <Option value="true" name="ShowOpenFormButton" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="year">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="true" name="allow_null" type="bool"/>
            <Option value="true" name="calendar_popup" type="bool"/>
            <Option value="yyyy" name="display_format" type="QString"/>
            <Option value="yyyy" name="field_format" type="QString"/>
            <Option value="false" name="field_iso_format" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="altitude">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="circular">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" name="CheckedState" type="QString"/>
            <Option value="" name="UncheckedState" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="form_dimension">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="remark">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geometry_polygon">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_rotation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_text">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_rotation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_text">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_precision">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_precisionalti">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_object_reference">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" name="IsMultiline" type="QString"/>
            <Option value="0" name="UseHtml" type="QString"/>
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
    <alias field="fk_installation" index="5" name=""/>
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
    <constraint field="id" desc="" exp=""/>
    <constraint field="identification" desc="" exp=""/>
    <constraint field="fk_distributor" desc="" exp=""/>
    <constraint field="fk_status" desc="" exp=""/>
    <constraint field="fk_cover_type" desc="" exp=""/>
    <constraint field="fk_installation" desc="" exp=""/>
    <constraint field="year" desc="" exp=""/>
    <constraint field="altitude" desc="" exp=""/>
    <constraint field="circular" desc="" exp=""/>
    <constraint field="form_dimension" desc="" exp=""/>
    <constraint field="remark" desc="" exp=""/>
    <constraint field="geometry_polygon" desc="" exp=""/>
    <constraint field="label_1_visible" desc="" exp=""/>
    <constraint field="label_1_x" desc="" exp=""/>
    <constraint field="label_1_y" desc="" exp=""/>
    <constraint field="label_1_rotation" desc="" exp=""/>
    <constraint field="label_1_text" desc="" exp=""/>
    <constraint field="label_2_visible" desc="" exp=""/>
    <constraint field="label_2_x" desc="" exp=""/>
    <constraint field="label_2_y" desc="" exp=""/>
    <constraint field="label_2_rotation" desc="" exp=""/>
    <constraint field="label_2_text" desc="" exp=""/>
    <constraint field="fk_precision" desc="" exp=""/>
    <constraint field="fk_precisionalti" desc="" exp=""/>
    <constraint field="fk_object_reference" desc="" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
    <actionsetting name="History audit" notificationMessage="" icon="" action="qgis.utils.plugins['postgres91plusauditor'].audit('od_cover20141219115626229',[% $id %])" type="1" id="{2ad5c10a-89e6-47ec-9c1c-59d569e38588}" shortTitle="" capture="0" isEnabledOnlyWhenEditable="0">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="0" sortExpression="" actionWidgetStyle="dropDown">
    <columns>
      <column name="id" width="-1" type="field" hidden="0"/>
      <column name="identification" width="-1" type="field" hidden="0"/>
      <column name="fk_distributor" width="-1" type="field" hidden="0"/>
      <column name="fk_status" width="-1" type="field" hidden="0"/>
      <column name="fk_cover_type" width="-1" type="field" hidden="0"/>
      <column name="fk_installation" width="-1" type="field" hidden="0"/>
      <column name="year" width="-1" type="field" hidden="0"/>
      <column name="altitude" width="-1" type="field" hidden="0"/>
      <column name="circular" width="-1" type="field" hidden="0"/>
      <column name="form_dimension" width="-1" type="field" hidden="0"/>
      <column name="remark" width="-1" type="field" hidden="0"/>
      <column name="geometry_polygon" width="-1" type="field" hidden="0"/>
      <column name="label_1_visible" width="-1" type="field" hidden="0"/>
      <column name="label_1_x" width="-1" type="field" hidden="0"/>
      <column name="label_1_y" width="-1" type="field" hidden="0"/>
      <column name="label_1_rotation" width="-1" type="field" hidden="0"/>
      <column name="label_1_text" width="-1" type="field" hidden="0"/>
      <column name="label_2_visible" width="-1" type="field" hidden="0"/>
      <column name="label_2_x" width="-1" type="field" hidden="0"/>
      <column name="label_2_y" width="-1" type="field" hidden="0"/>
      <column name="label_2_rotation" width="-1" type="field" hidden="0"/>
      <column name="label_2_text" width="-1" type="field" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
      <column name="fk_precision" width="-1" type="field" hidden="0"/>
      <column name="fk_precisionalti" width="-1" type="field" hidden="0"/>
      <column name="fk_object_reference" width="-1" type="field" hidden="0"/>
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
    <attributeEditorContainer showLabel="1" name="Général" visibilityExpressionEnabled="0" columnCount="2" visibilityExpression="" groupBox="0">
      <attributeEditorField showLabel="1" name="id" index="0"/>
      <attributeEditorField showLabel="1" name="fk_distributor" index="2"/>
      <attributeEditorField showLabel="1" name="identification" index="1"/>
      <attributeEditorField showLabel="1" name="fk_status" index="3"/>
      <attributeEditorField showLabel="1" name="fk_installation" index="5"/>
      <attributeEditorField showLabel="1" name="fk_cover_type" index="4"/>
      <attributeEditorField showLabel="1" name="form_dimension" index="9"/>
      <attributeEditorField showLabel="1" name="year" index="6"/>
    </attributeEditorContainer>
    <attributeEditorField showLabel="1" name="circular" index="8"/>
    <attributeEditorField showLabel="1" name="remark" index="10"/>
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
