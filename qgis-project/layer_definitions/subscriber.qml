<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyAlgorithm="0" readOnly="0" simplifyDrawingTol="1" styleCategories="AllStyleCategories" maxScale="4" simplifyMaxScale="1" simplifyDrawingHints="0" minScale="1e+08" labelsEnabled="1" simplifyLocal="1" version="3.4.7-Madeira" hasScaleBasedVisibilityFlag="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" enableorderby="0" type="RuleRenderer" forceraster="0">
    <rules key="{9da47fbf-2d24-4c58-a431-b86b56a823b4}">
      <rule scalemaxdenom="3001" label="Echelle" key="{26e873de-fb8b-4cf1-9540-12b4fd50d4da}">
        <rule filter="fk_subscriber_type=9401" symbol="0" label="Abonnés" key="{ec8badcc-9af2-4942-bd0e-f6519b9f1b97}"/>
        <rule filter="fk_status!=1301" symbol="1" label="Inactif" key="{74d11c30-58d7-4d2a-b1e3-86945e6466d5}"/>
        <rule filter="fk_subscriber_type=9402" symbol="2" label="Arrosage" key="{ede67b97-6776-4785-b302-301be3e60cd7}"/>
        <rule filter="fk_subscriber_type = 9403" symbol="3" label="Fontaine" key="{e621e468-ba49-4e32-89a6-1cf8da2fa202}"/>
        <rule filter="fk_subscriber_type=9405" symbol="4" label="Sprinkler" key="{d65de48d-b504-438c-b40d-009b640bac2d}"/>
        <rule filter="fk_subscriber_type=9404" symbol="5" label="WC" key="{8893b40b-a12a-4f74-a391-5e4df2572f9c}"/>
      </rule>
      <rule filter="ELSE" scalemaxdenom="3001" symbol="6" label="Incomplètes" key="{93f909a5-63e2-408f-9d76-f0c18a350900}" scalemindenom="1000"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="0">
        <layer pass="0" enabled="1" locked="0" class="SimpleMarker">
          <prop k="angle" v="0"/>
          <prop k="color" v="255,255,255,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.3"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="3.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="opacity" v="1"/>
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
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="1">
        <layer pass="0" enabled="1" locked="0" class="SimpleMarker">
          <prop k="angle" v="0"/>
          <prop k="color" v="255,0,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="cross2"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="255,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="3"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="opacity" v="1"/>
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
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="2">
        <layer pass="0" enabled="1" locked="0" class="SimpleMarker">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,255,255,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.5"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="3.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="opacity" v="1"/>
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
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="3">
        <layer pass="0" enabled="1" locked="0" class="SimpleMarker">
          <prop k="angle" v="0"/>
          <prop k="color" v="255,170,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.5"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="3.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="opacity" v="1"/>
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
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="4">
        <layer pass="0" enabled="1" locked="0" class="SimpleMarker">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,255,127,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.5"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="3.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="opacity" v="1"/>
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
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="5">
        <layer pass="0" enabled="1" locked="0" class="SimpleMarker">
          <prop k="angle" v="0"/>
          <prop k="color" v="255,170,255,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.5"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="3.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="opacity" v="1"/>
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
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="6">
        <layer pass="0" enabled="1" locked="0" class="SimpleMarker">
          <prop k="angle" v="0"/>
          <prop k="color" v="243,69,255,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="3"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
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
    <effect type="effectStack" enabled="0">
      <effect type="drawSource">
        <prop k="blend_mode" v="0"/>
        <prop k="draw_mode" v="2"/>
        <prop k="enabled" v="1"/>
        <prop k="opacity" v="1"/>
      </effect>
    </effect>
  </renderer-v2>
  <labeling type="simple">
    <settings>
      <text-style previewBkgrdColor="#ffffff" fontItalic="0" textColor="0,0,0,255" fontUnderline="0" namedStyle="Normal" blendMode="0" fontSizeUnit="MapUnit" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontWordSpacing="0" fontFamily="Sans Serif" fontStrikeout="0" fontWeight="50" multilineHeight="1.2" fontLetterSpacing="0" fieldName="identification ||&#xa;CASE &#xa;WHEN fk_subscriber_type = 9401 THEN ''&#xa;WHEN fk_subscriber_type = 9402 THEN '#!#ARR'&#xa;WHEN fk_subscriber_type = 9403 THEN '#!#FON'&#xa;WHEN fk_subscriber_type = 9404 THEN '#!#WC'&#xa;WHEN fk_subscriber_type = 9405 THEN '#!#SPK'&#xa;ELSE ''&#xa;END" isExpression="1" textOpacity="1" fontCapitals="0" useSubstitutions="0" fontSize="0.9">
        <text-buffer bufferBlendMode="0" bufferDraw="0" bufferJoinStyle="64" bufferColor="255,255,255,255" bufferOpacity="1" bufferSizeUnits="MM" bufferNoFill="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="0.05"/>
        <background shapeOffsetY="0" shapeDraw="0" shapeOffsetUnit="MM" shapeSizeUnit="MM" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOpacity="1" shapeBlendMode="0" shapeOffsetX="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="0" shapeType="0" shapeFillColor="255,255,255,255" shapeBorderWidth="0" shapeSizeType="0" shapeJoinStyle="64" shapeRadiiUnit="MM" shapeSVGFile="" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeSizeY="0" shapeRotationType="0" shapeRotation="0" shapeRadiiY="0" shapeSizeX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderColor="128,128,128,255"/>
        <shadow shadowRadiusAlphaOnly="0" shadowScale="100" shadowDraw="0" shadowOffsetAngle="135" shadowOffsetGlobal="1" shadowOpacity="0.7" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowUnder="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowRadius="1.5" shadowBlendMode="6" shadowColor="0,0,0,255"/>
        <substitutions/>
      </text-style>
      <text-format addDirectionSymbol="0" wrapChar="#!#" rightDirectionSymbol=">" formatNumbers="0" plussign="0" useMaxLineLengthForAutoWrap="1" leftDirectionSymbol="&lt;" autoWrapLength="0" multilineAlign="1" reverseDirectionSymbol="0" decimals="0" placeDirectionSymbol="0"/>
      <placement repeatDistance="0" offsetUnits="MM" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" preserveRotation="1" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" fitInPolygonOnly="0" centroidInside="0" offsetType="0" distUnits="MM" maxCurvedCharAngleIn="20" placement="1" dist="0" xOffset="0" maxCurvedCharAngleOut="-20" quadOffset="4" placementFlags="0" centroidWhole="0" rotationAngle="0" priority="5" distMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceUnits="MM" yOffset="0"/>
      <rendering limitNumLabels="0" drawLabels="1" fontMinPixelSize="3" fontMaxPixelSize="10000" scaleVisibility="1" mergeLines="0" zIndex="0" scaleMax="10000" fontLimitPixelSize="0" obstacleFactor="1" upsidedownLabels="0" labelPerPart="0" minFeatureSize="0" obstacle="1" scaleMin="1" maxNumLabels="2000" obstacleType="0" displayAll="0"/>
      <dd_properties>
        <Option type="Map">
          <Option value="" type="QString" name="name"/>
          <Option type="Map" name="properties">
            <Option type="Map" name="AlwaysShow">
              <Option value="false" type="bool" name="active"/>
              <Option value="1" type="QString" name="expression"/>
              <Option value="3" type="int" name="type"/>
            </Option>
            <Option type="Map" name="Hali">
              <Option value="true" type="bool" name="active"/>
              <Option value="'Center'" type="QString" name="expression"/>
              <Option value="3" type="int" name="type"/>
            </Option>
            <Option type="Map" name="PositionX">
              <Option value="true" type="bool" name="active"/>
              <Option value="xat( 0)" type="QString" name="expression"/>
              <Option value="3" type="int" name="type"/>
            </Option>
            <Option type="Map" name="PositionY">
              <Option value="true" type="bool" name="active"/>
              <Option value="yat(0)" type="QString" name="expression"/>
              <Option value="3" type="int" name="type"/>
            </Option>
            <Option type="Map" name="Vali">
              <Option value="true" type="bool" name="active"/>
              <Option value="'Half'" type="QString" name="expression"/>
              <Option value="3" type="int" name="type"/>
            </Option>
          </Option>
          <Option value="collection" type="QString" name="type"/>
        </Option>
      </dd_properties>
    </settings>
  </labeling>
  <customproperties>
    <property value="fk_pipe" key="LinkIt_destinationField"/>
    <property value="Abonnés - conduite" key="LinkIt_name"/>
    <property value="conduites_copy20130709141244955" key="LinkIt_sourceLayer"/>
    <property key="dualview/previewExpressions">
      <value>COALESCE( "id", '&lt;NULL>' )</value>
      <value>COALESCE( "id", '&lt;NULL>' )</value>
    </property>
    <property value="0" key="embeddedWidgets/count"/>
    <property value="yes" key="itemBrowserConnected"/>
    <property value="0" key="itemBrowserCurrentItem"/>
    <property value="[]" key="itemBrowserSelection"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Pie">
    <DiagramCategory penColor="#000000" backgroundColor="#ffffff" height="15" lineSizeScale="3x:0,0,0,0,0,0" diagramOrientation="Up" penAlpha="255" maxScaleDenominator="1e+08" scaleDependency="Area" minimumSize="0" penWidth="0" scaleBasedVisibility="1" sizeScale="3x:0,0,0,0,0,0" minScaleDenominator="4" sizeType="MM" backgroundAlpha="255" rotationOffset="270" width="15" opacity="1" lineSizeType="MM" enabled="0" barWidth="5" labelPlacementMethod="XHeight">
      <fontProperties style="" description="Cantarell,11,-1,5,50,0,0,0,0,0"/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" priority="0" zIndex="0" linePlacementFlags="2" placement="0" obstacle="0" showAll="1">
    <properties>
      <Option type="Map">
        <Option value="" type="QString" name="name"/>
        <Option type="Map" name="properties">
          <Option type="Map" name="show">
            <Option value="true" type="bool" name="active"/>
            <Option value="id" type="QString" name="field"/>
            <Option value="2" type="int" name="type"/>
          </Option>
        </Option>
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
    <field name="fk_district">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="district20130304110004764" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="name" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pressurezone">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="pressurezone20130417133612105" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="name" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_printmap">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="1" type="QString" name="AllowMulti"/>
            <Option value="0" type="QString" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="printmap20130304110011400" type="QString" name="Layer"/>
            <Option value="0" type="QString" name="OrderByValue"/>
            <Option value="0" type="QString" name="UseCompleter"/>
            <Option value="name" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_printmaps">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_geometry_alt1_used">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_geometry_alt2_used">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_node_type">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_orientation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_schema_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geometry_alt1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geometry_alt2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="update_geometry_alt1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="update_geometry_alt2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
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
    <field name="fk_folder">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_locationtype">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="1" type="QString" name="AllowMulti"/>
            <Option value="1" type="QString" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="locationtype20150922082741813" type="QString" name="Layer"/>
            <Option value="0" type="QString" name="OrderByValue"/>
            <Option value="0" type="QString" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_precision">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_precision20130304110011372" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_precisionalti">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="AllowMulti"/>
            <Option value="1" type="QString" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_precisionalti20131211161429510" type="QString" name="Layer"/>
            <Option value="0" type="QString" name="OrderByValue"/>
            <Option value="0" type="QString" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_object_reference">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="AllowMulti"/>
            <Option value="1" type="QString" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="object_reference20150922083109152" type="QString" name="Layer"/>
            <Option value="0" type="QString" name="OrderByValue"/>
            <Option value="0" type="QString" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
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
    <field name="year">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="year_end">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="orientation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="remark">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="IsMultiline"/>
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
    <field name="fk_subscriber_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_subscriber_type20130304110011480" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pipe">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowAddFeatures"/>
            <Option value="true" type="bool" name="AllowNULL"/>
            <Option value="true" type="bool" name="MapIdentification"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="true" type="bool" name="ReadOnly"/>
            <Option value="relation_pipe_subscriber" type="QString" name="Relation"/>
            <Option value="false" type="bool" name="ShowForm"/>
            <Option value="true" type="bool" name="ShowOpenFormButton"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="parcel">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flow_current">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flow_planned">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="district_name">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="district_shortname">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="district_zip">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="district_land_registry">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="district_prefix">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" index="0" name="ID"/>
    <alias field="fk_district" index="1" name="Commune"/>
    <alias field="fk_pressurezone" index="2" name="Zone de pression"/>
    <alias field="fk_printmap" index="3" name="Folios"/>
    <alias field="_printmaps" index="4" name="Folios"/>
    <alias field="_geometry_alt1_used" index="5" name=""/>
    <alias field="_geometry_alt2_used" index="6" name=""/>
    <alias field="_pipe_node_type" index="7" name=""/>
    <alias field="_pipe_orientation" index="8" name=""/>
    <alias field="_pipe_schema_visible" index="9" name=""/>
    <alias field="geometry_alt1" index="10" name=""/>
    <alias field="geometry_alt2" index="11" name=""/>
    <alias field="update_geometry_alt1" index="12" name=""/>
    <alias field="update_geometry_alt2" index="13" name=""/>
    <alias field="identification" index="14" name="Identification"/>
    <alias field="fk_distributor" index="15" name="Distributeur"/>
    <alias field="fk_status" index="16" name="Statut"/>
    <alias field="fk_folder" index="17" name=""/>
    <alias field="fk_locationtype" index="18" name=""/>
    <alias field="fk_precision" index="19" name=""/>
    <alias field="fk_precisionalti" index="20" name=""/>
    <alias field="fk_object_reference" index="21" name=""/>
    <alias field="altitude" index="22" name=""/>
    <alias field="year" index="23" name=""/>
    <alias field="year_end" index="24" name=""/>
    <alias field="orientation" index="25" name=""/>
    <alias field="remark" index="26" name="Commentaire"/>
    <alias field="label_1_visible" index="27" name=""/>
    <alias field="label_1_x" index="28" name=""/>
    <alias field="label_1_y" index="29" name=""/>
    <alias field="label_1_rotation" index="30" name=""/>
    <alias field="label_1_text" index="31" name=""/>
    <alias field="label_2_visible" index="32" name=""/>
    <alias field="label_2_x" index="33" name=""/>
    <alias field="label_2_y" index="34" name=""/>
    <alias field="label_2_rotation" index="35" name=""/>
    <alias field="label_2_text" index="36" name=""/>
    <alias field="fk_subscriber_type" index="37" name="tYPE"/>
    <alias field="fk_pipe" index="38" name="Conduite"/>
    <alias field="parcel" index="39" name="Parcelle"/>
    <alias field="flow_current" index="40" name="Débit"/>
    <alias field="flow_planned" index="41" name="Débit prévu"/>
    <alias field="district_name" index="42" name=""/>
    <alias field="district_shortname" index="43" name=""/>
    <alias field="district_zip" index="44" name=""/>
    <alias field="district_land_registry" index="45" name=""/>
    <alias field="district_prefix" index="46" name="Préfix"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" applyOnUpdate="0" expression=""/>
    <default field="fk_district" applyOnUpdate="0" expression=""/>
    <default field="fk_pressurezone" applyOnUpdate="0" expression=""/>
    <default field="fk_printmap" applyOnUpdate="0" expression=""/>
    <default field="_printmaps" applyOnUpdate="0" expression=""/>
    <default field="_geometry_alt1_used" applyOnUpdate="0" expression=""/>
    <default field="_geometry_alt2_used" applyOnUpdate="0" expression=""/>
    <default field="_pipe_node_type" applyOnUpdate="0" expression=""/>
    <default field="_pipe_orientation" applyOnUpdate="0" expression=""/>
    <default field="_pipe_schema_visible" applyOnUpdate="0" expression=""/>
    <default field="geometry_alt1" applyOnUpdate="0" expression=""/>
    <default field="geometry_alt2" applyOnUpdate="0" expression=""/>
    <default field="update_geometry_alt1" applyOnUpdate="0" expression=""/>
    <default field="update_geometry_alt2" applyOnUpdate="0" expression=""/>
    <default field="identification" applyOnUpdate="0" expression=""/>
    <default field="fk_distributor" applyOnUpdate="0" expression=""/>
    <default field="fk_status" applyOnUpdate="0" expression=""/>
    <default field="fk_folder" applyOnUpdate="0" expression=""/>
    <default field="fk_locationtype" applyOnUpdate="0" expression=""/>
    <default field="fk_precision" applyOnUpdate="0" expression=""/>
    <default field="fk_precisionalti" applyOnUpdate="0" expression=""/>
    <default field="fk_object_reference" applyOnUpdate="0" expression=""/>
    <default field="altitude" applyOnUpdate="0" expression=""/>
    <default field="year" applyOnUpdate="0" expression=""/>
    <default field="year_end" applyOnUpdate="0" expression=""/>
    <default field="orientation" applyOnUpdate="0" expression=""/>
    <default field="remark" applyOnUpdate="0" expression=""/>
    <default field="label_1_visible" applyOnUpdate="0" expression=""/>
    <default field="label_1_x" applyOnUpdate="0" expression=""/>
    <default field="label_1_y" applyOnUpdate="0" expression=""/>
    <default field="label_1_rotation" applyOnUpdate="0" expression=""/>
    <default field="label_1_text" applyOnUpdate="0" expression=""/>
    <default field="label_2_visible" applyOnUpdate="0" expression=""/>
    <default field="label_2_x" applyOnUpdate="0" expression=""/>
    <default field="label_2_y" applyOnUpdate="0" expression=""/>
    <default field="label_2_rotation" applyOnUpdate="0" expression=""/>
    <default field="label_2_text" applyOnUpdate="0" expression=""/>
    <default field="fk_subscriber_type" applyOnUpdate="0" expression=""/>
    <default field="fk_pipe" applyOnUpdate="0" expression=""/>
    <default field="parcel" applyOnUpdate="0" expression=""/>
    <default field="flow_current" applyOnUpdate="0" expression=""/>
    <default field="flow_planned" applyOnUpdate="0" expression=""/>
    <default field="district_name" applyOnUpdate="0" expression=""/>
    <default field="district_shortname" applyOnUpdate="0" expression=""/>
    <default field="district_zip" applyOnUpdate="0" expression=""/>
    <default field="district_land_registry" applyOnUpdate="0" expression=""/>
    <default field="district_prefix" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint constraints="3" field="id" unique_strength="1" notnull_strength="1" exp_strength="0"/>
    <constraint constraints="0" field="fk_district" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="fk_pressurezone" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="fk_printmap" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="_printmaps" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="_geometry_alt1_used" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="_geometry_alt2_used" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="_pipe_node_type" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="_pipe_orientation" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="_pipe_schema_visible" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="geometry_alt1" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="geometry_alt2" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="update_geometry_alt1" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="update_geometry_alt2" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="identification" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="fk_distributor" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="fk_status" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="fk_folder" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="fk_locationtype" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="fk_precision" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="fk_precisionalti" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="fk_object_reference" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="altitude" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="year" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="year_end" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="orientation" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="remark" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="label_1_visible" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="label_1_x" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="label_1_y" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="label_1_rotation" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="label_1_text" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="label_2_visible" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="label_2_x" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="label_2_y" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="label_2_rotation" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="label_2_text" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="fk_subscriber_type" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="fk_pipe" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="parcel" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="flow_current" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="flow_planned" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="3" field="district_name" unique_strength="1" notnull_strength="1" exp_strength="0"/>
    <constraint constraints="0" field="district_shortname" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="district_zip" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="district_land_registry" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="district_prefix" unique_strength="0" notnull_strength="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" desc="" exp=""/>
    <constraint field="fk_district" desc="" exp=""/>
    <constraint field="fk_pressurezone" desc="" exp=""/>
    <constraint field="fk_printmap" desc="" exp=""/>
    <constraint field="_printmaps" desc="" exp=""/>
    <constraint field="_geometry_alt1_used" desc="" exp=""/>
    <constraint field="_geometry_alt2_used" desc="" exp=""/>
    <constraint field="_pipe_node_type" desc="" exp=""/>
    <constraint field="_pipe_orientation" desc="" exp=""/>
    <constraint field="_pipe_schema_visible" desc="" exp=""/>
    <constraint field="geometry_alt1" desc="" exp=""/>
    <constraint field="geometry_alt2" desc="" exp=""/>
    <constraint field="update_geometry_alt1" desc="" exp=""/>
    <constraint field="update_geometry_alt2" desc="" exp=""/>
    <constraint field="identification" desc="" exp=""/>
    <constraint field="fk_distributor" desc="" exp=""/>
    <constraint field="fk_status" desc="" exp=""/>
    <constraint field="fk_folder" desc="" exp=""/>
    <constraint field="fk_locationtype" desc="" exp=""/>
    <constraint field="fk_precision" desc="" exp=""/>
    <constraint field="fk_precisionalti" desc="" exp=""/>
    <constraint field="fk_object_reference" desc="" exp=""/>
    <constraint field="altitude" desc="" exp=""/>
    <constraint field="year" desc="" exp=""/>
    <constraint field="year_end" desc="" exp=""/>
    <constraint field="orientation" desc="" exp=""/>
    <constraint field="remark" desc="" exp=""/>
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
    <constraint field="fk_subscriber_type" desc="" exp=""/>
    <constraint field="fk_pipe" desc="" exp=""/>
    <constraint field="parcel" desc="" exp=""/>
    <constraint field="flow_current" desc="" exp=""/>
    <constraint field="flow_planned" desc="" exp=""/>
    <constraint field="district_name" desc="" exp=""/>
    <constraint field="district_shortname" desc="" exp=""/>
    <constraint field="district_zip" desc="" exp=""/>
    <constraint field="district_land_registry" desc="" exp=""/>
    <constraint field="district_prefix" desc="" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
    <actionsetting icon="" id="{da341ace-1aee-4dfd-b7a4-bbdc17decb8d}" isEnabledOnlyWhenEditable="0" shortTitle="" notificationMessage="" type="1" capture="0" name="Abonnés - conduite" action="qgis.utils.plugins['linkit'].linkit('subscriber20130304110011459','fk_pipe','conduites_copy20130709141244955', [% $id %])">
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column width="-1" hidden="0" type="field" name="id"/>
      <column width="-1" hidden="0" type="field" name="fk_district"/>
      <column width="-1" hidden="0" type="field" name="fk_pressurezone"/>
      <column width="-1" hidden="0" type="field" name="fk_printmap"/>
      <column width="-1" hidden="0" type="field" name="_printmaps"/>
      <column width="-1" hidden="0" type="field" name="_geometry_alt1_used"/>
      <column width="-1" hidden="0" type="field" name="_geometry_alt2_used"/>
      <column width="-1" hidden="0" type="field" name="_pipe_node_type"/>
      <column width="-1" hidden="0" type="field" name="_pipe_orientation"/>
      <column width="-1" hidden="0" type="field" name="_pipe_schema_visible"/>
      <column width="-1" hidden="0" type="field" name="geometry_alt1"/>
      <column width="-1" hidden="0" type="field" name="geometry_alt2"/>
      <column width="-1" hidden="0" type="field" name="update_geometry_alt1"/>
      <column width="-1" hidden="0" type="field" name="update_geometry_alt2"/>
      <column width="-1" hidden="0" type="field" name="identification"/>
      <column width="-1" hidden="0" type="field" name="fk_distributor"/>
      <column width="-1" hidden="0" type="field" name="fk_status"/>
      <column width="-1" hidden="0" type="field" name="fk_folder"/>
      <column width="-1" hidden="0" type="field" name="fk_locationtype"/>
      <column width="-1" hidden="0" type="field" name="year"/>
      <column width="-1" hidden="0" type="field" name="year_end"/>
      <column width="-1" hidden="0" type="field" name="remark"/>
      <column width="-1" hidden="0" type="field" name="label_1_visible"/>
      <column width="-1" hidden="0" type="field" name="label_1_x"/>
      <column width="-1" hidden="0" type="field" name="label_1_y"/>
      <column width="-1" hidden="0" type="field" name="label_1_rotation"/>
      <column width="-1" hidden="0" type="field" name="label_1_text"/>
      <column width="-1" hidden="0" type="field" name="label_2_visible"/>
      <column width="-1" hidden="0" type="field" name="label_2_x"/>
      <column width="-1" hidden="0" type="field" name="label_2_y"/>
      <column width="-1" hidden="0" type="field" name="label_2_rotation"/>
      <column width="-1" hidden="0" type="field" name="label_2_text"/>
      <column width="-1" hidden="0" type="field" name="fk_precision"/>
      <column width="-1" hidden="0" type="field" name="fk_precisionalti"/>
      <column width="-1" hidden="0" type="field" name="fk_object_reference"/>
      <column width="-1" hidden="0" type="field" name="altitude"/>
      <column width="-1" hidden="0" type="field" name="orientation"/>
      <column width="-1" hidden="0" type="field" name="fk_subscriber_type"/>
      <column width="-1" hidden="0" type="field" name="fk_pipe"/>
      <column width="-1" hidden="0" type="field" name="parcel"/>
      <column width="-1" hidden="0" type="field" name="flow_current"/>
      <column width="-1" hidden="0" type="field" name="flow_planned"/>
      <column width="-1" hidden="0" type="field" name="district_name"/>
      <column width="-1" hidden="0" type="field" name="district_shortname"/>
      <column width="-1" hidden="0" type="field" name="district_zip"/>
      <column width="-1" hidden="0" type="field" name="district_land_registry"/>
      <column width="-1" hidden="0" type="field" name="district_prefix"/>
      <column width="-1" hidden="1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">/home/lbartoletti/QWAT/qgis-project/ui_forms/subscriber.ui</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>/usr/home/lbartoletti/QWAT/qgis-project</editforminitfilepath>
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
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer showLabel="0" columnCount="2" groupBox="0" visibilityExpressionEnabled="0" name="" visibilityExpression="">
      <attributeEditorField showLabel="1" index="0" name="id"/>
      <attributeEditorField showLabel="1" index="37" name="fk_subscriber_type"/>
      <attributeEditorField showLabel="1" index="46" name="district_prefix"/>
      <attributeEditorField showLabel="1" index="14" name="identification"/>
      <attributeEditorField showLabel="1" index="38" name="fk_pipe"/>
      <attributeEditorField showLabel="1" index="16" name="fk_status"/>
      <attributeEditorField showLabel="1" index="15" name="fk_distributor"/>
      <attributeEditorField showLabel="1" index="4" name="_printmaps"/>
      <attributeEditorField showLabel="1" index="39" name="parcel"/>
      <attributeEditorField showLabel="1" index="2" name="fk_pressurezone"/>
      <attributeEditorField showLabel="1" index="1" name="fk_district"/>
      <attributeEditorField showLabel="1" index="40" name="flow_current"/>
      <attributeEditorField showLabel="1" index="41" name="flow_planned"/>
      <attributeEditorField showLabel="1" index="19" name="fk_precision"/>
    </attributeEditorContainer>
    <attributeEditorField showLabel="1" index="26" name="remark"/>
  </attributeEditorForm>
  <editable>
    <field name="_geometry_alt1_used" editable="1"/>
    <field name="_geometry_alt2_used" editable="1"/>
    <field name="_pipe_node_type" editable="1"/>
    <field name="_pipe_orientation" editable="1"/>
    <field name="_pipe_schema_visible" editable="1"/>
    <field name="_printmaps" editable="1"/>
    <field name="altitude" editable="1"/>
    <field name="district_land_registry" editable="0"/>
    <field name="district_name" editable="0"/>
    <field name="district_prefix" editable="0"/>
    <field name="district_shortname" editable="0"/>
    <field name="district_zip" editable="0"/>
    <field name="fk_distributor" editable="1"/>
    <field name="fk_district" editable="1"/>
    <field name="fk_folder" editable="1"/>
    <field name="fk_locationtype" editable="1"/>
    <field name="fk_object_reference" editable="1"/>
    <field name="fk_pipe" editable="1"/>
    <field name="fk_precision" editable="1"/>
    <field name="fk_precisionalti" editable="1"/>
    <field name="fk_pressurezone" editable="1"/>
    <field name="fk_printmap" editable="1"/>
    <field name="fk_status" editable="1"/>
    <field name="fk_subscriber_type" editable="1"/>
    <field name="flow_current" editable="1"/>
    <field name="flow_planned" editable="1"/>
    <field name="geometry_alt1" editable="1"/>
    <field name="geometry_alt2" editable="1"/>
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
    <field name="orientation" editable="1"/>
    <field name="parcel" editable="1"/>
    <field name="remark" editable="1"/>
    <field name="update_geometry_alt1" editable="1"/>
    <field name="update_geometry_alt2" editable="1"/>
    <field name="year" editable="1"/>
    <field name="year_end" editable="1"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="_geometry_alt1_used"/>
    <field labelOnTop="0" name="_geometry_alt2_used"/>
    <field labelOnTop="0" name="_pipe_node_type"/>
    <field labelOnTop="0" name="_pipe_orientation"/>
    <field labelOnTop="0" name="_pipe_schema_visible"/>
    <field labelOnTop="0" name="_printmaps"/>
    <field labelOnTop="0" name="altitude"/>
    <field labelOnTop="0" name="district_land_registry"/>
    <field labelOnTop="0" name="district_name"/>
    <field labelOnTop="0" name="district_prefix"/>
    <field labelOnTop="0" name="district_shortname"/>
    <field labelOnTop="0" name="district_zip"/>
    <field labelOnTop="0" name="fk_distributor"/>
    <field labelOnTop="0" name="fk_district"/>
    <field labelOnTop="0" name="fk_folder"/>
    <field labelOnTop="0" name="fk_locationtype"/>
    <field labelOnTop="0" name="fk_object_reference"/>
    <field labelOnTop="0" name="fk_pipe"/>
    <field labelOnTop="0" name="fk_precision"/>
    <field labelOnTop="0" name="fk_precisionalti"/>
    <field labelOnTop="0" name="fk_pressurezone"/>
    <field labelOnTop="0" name="fk_printmap"/>
    <field labelOnTop="0" name="fk_status"/>
    <field labelOnTop="0" name="fk_subscriber_type"/>
    <field labelOnTop="0" name="flow_current"/>
    <field labelOnTop="0" name="flow_planned"/>
    <field labelOnTop="0" name="geometry_alt1"/>
    <field labelOnTop="0" name="geometry_alt2"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="identification"/>
    <field labelOnTop="0" name="label_1_rotation"/>
    <field labelOnTop="0" name="label_1_text"/>
    <field labelOnTop="0" name="label_1_visible"/>
    <field labelOnTop="0" name="label_1_x"/>
    <field labelOnTop="0" name="label_1_y"/>
    <field labelOnTop="0" name="label_2_rotation"/>
    <field labelOnTop="0" name="label_2_text"/>
    <field labelOnTop="0" name="label_2_visible"/>
    <field labelOnTop="0" name="label_2_x"/>
    <field labelOnTop="0" name="label_2_y"/>
    <field labelOnTop="0" name="orientation"/>
    <field labelOnTop="0" name="parcel"/>
    <field labelOnTop="0" name="remark"/>
    <field labelOnTop="0" name="update_geometry_alt1"/>
    <field labelOnTop="0" name="update_geometry_alt2"/>
    <field labelOnTop="0" name="year"/>
    <field labelOnTop="0" name="year_end"/>
  </labelOnTop>
  <widgets>
    <widget name="relation_subscriber_reference">
      <config type="Map">
        <Option value="" type="QString" name="nm-rel"/>
      </config>
    </widget>
  </widgets>
  <previewExpression>COALESCE( "id", '&lt;NULL>' )</previewExpression>
  <mapTip>district_name</mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
