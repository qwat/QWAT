<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyMaxScale="1" hasScaleBasedVisibilityFlag="1" maxScale="0" readOnly="0" simplifyAlgorithm="0" styleCategories="AllStyleCategories" version="3.4.7-Madeira" simplifyLocal="1" labelsEnabled="1" minScale="10001" simplifyDrawingTol="1" simplifyDrawingHints="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" type="singleSymbol" enableorderby="0">
    <symbols>
      <symbol alpha="1" type="marker" force_rhr="0" clip_to_extent="1" name="0">
        <layer pass="0" class="SvgMarker" locked="0" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/hydrant.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_width" v="1"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="5"/>
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
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
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
      <text-style fieldName="CASE WHEN  &quot;underground&quot;= 'true' THEN 'HS' ELSE 'BH' END ||identification" namedStyle="Normal" fontCapitals="0" fontFamily="Sans Serif" fontSize="9" textOpacity="1" useSubstitutions="0" fontUnderline="0" isExpression="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" previewBkgrdColor="#ffffff" textColor="58,90,217,255" multilineHeight="1" fontItalic="0" fontWordSpacing="0" fontStrikeout="0" fontWeight="50" blendMode="0" fontLetterSpacing="0" fontSizeUnit="Point">
        <text-buffer bufferColor="255,255,255,255" bufferSizeUnits="MM" bufferOpacity="0.64" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="0.6" bufferDraw="1" bufferNoFill="0" bufferJoinStyle="64" bufferBlendMode="0"/>
        <background shapeOffsetY="0" shapeRotationType="0" shapeOffsetX="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="MM" shapeRadiiUnit="MM" shapeRadiiY="0" shapeBorderWidthUnit="MM" shapeSizeType="0" shapeOpacity="1" shapeType="0" shapeSizeY="0" shapeRadiiX="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeSizeX="0" shapeFillColor="255,255,255,255" shapeJoinStyle="64" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeDraw="0" shapeRotation="0" shapeBorderColor="128,128,128,255" shapeBlendMode="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeSVGFile=""/>
        <shadow shadowOffsetGlobal="1" shadowOffsetDist="1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadius="1.5" shadowRadiusAlphaOnly="0" shadowOpacity="0.7" shadowScale="100" shadowOffsetAngle="135" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowOffsetUnit="MM" shadowColor="0,0,0,255" shadowDraw="0" shadowUnder="0" shadowRadiusUnit="MM"/>
        <substitutions/>
      </text-style>
      <text-format wrapChar="" addDirectionSymbol="0" decimals="0" formatNumbers="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" autoWrapLength="0" useMaxLineLengthForAutoWrap="1" leftDirectionSymbol="&lt;" plussign="0" multilineAlign="0" rightDirectionSymbol=">"/>
      <placement maxCurvedCharAngleOut="-20" quadOffset="4" priority="5" preserveRotation="1" xOffset="0" repeatDistance="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" fitInPolygonOnly="0" yOffset="0" maxCurvedCharAngleIn="20" rotationAngle="0" offsetType="0" placementFlags="0" distMapUnitScale="3x:0,0,0,0,0,0" centroidWhole="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" centroidInside="0" offsetUnits="MapUnit" distUnits="MM" placement="0" repeatDistanceUnits="MM" dist="1.8" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR"/>
      <rendering upsidedownLabels="0" obstacle="1" mergeLines="0" obstacleType="0" maxNumLabels="2000" drawLabels="1" fontMinPixelSize="3" scaleMin="1" fontMaxPixelSize="10000" scaleMax="6000" limitNumLabels="0" scaleVisibility="1" displayAll="1" zIndex="0" fontLimitPixelSize="0" minFeatureSize="0" obstacleFactor="1" labelPerPart="0"/>
      <dd_properties>
        <Option type="Map">
          <Option type="QString" name="name" value=""/>
          <Option type="Map" name="properties">
            <Option type="Map" name="LabelRotation">
              <Option type="bool" name="active" value="true"/>
              <Option type="QString" name="expression" value="360 - (&quot;label_1_rotation&quot;)"/>
              <Option type="int" name="type" value="3"/>
            </Option>
            <Option type="Map" name="PositionX">
              <Option type="bool" name="active" value="true"/>
              <Option type="QString" name="field" value="label_1_x"/>
              <Option type="int" name="type" value="2"/>
            </Option>
            <Option type="Map" name="PositionY">
              <Option type="bool" name="active" value="true"/>
              <Option type="QString" name="field" value="label_1_y"/>
              <Option type="int" name="type" value="2"/>
            </Option>
          </Option>
          <Option type="QString" name="type" value="collection"/>
        </Option>
      </dd_properties>
    </settings>
  </labeling>
  <customproperties>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="itemBrowserConnected" value="no"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Pie" attributeLegend="1">
    <DiagramCategory labelPlacementMethod="XHeight" maxScaleDenominator="10001" backgroundColor="#ffffff" height="15" rotationOffset="270" lineSizeScale="3x:0,0,0,0,0,0" minScaleDenominator="-2.14748e+09" scaleBasedVisibility="1" sizeScale="3x:0,0,0,0,0,0" enabled="0" width="15" backgroundAlpha="255" minimumSize="0" sizeType="MM" lineSizeType="MM" scaleDependency="Area" barWidth="5" opacity="1" diagramOrientation="Up" penWidth="0" penAlpha="255" penColor="#000000">
      <fontProperties description="Cantarell,11,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" color="#000000" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings zIndex="0" dist="0" linePlacementFlags="2" placement="0" priority="0" showAll="1" obstacle="0">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option type="Map" name="properties">
          <Option type="Map" name="show">
            <Option type="bool" name="active" value="true"/>
            <Option type="QString" name="field" value="id"/>
            <Option type="int" name="type" value="2"/>
          </Option>
        </Option>
        <Option type="QString" name="type" value="collection"/>
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
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_district">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="district20130304110004764"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="name"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pressurezone">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="pressurezone20130417133612105"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="name"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_printmap">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="QString" name="AllowMulti" value="1"/>
            <Option type="QString" name="AllowNull" value="0"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="printmap20130304110011400"/>
            <Option type="QString" name="OrderByValue" value="0"/>
            <Option type="QString" name="UseCompleter" value="0"/>
            <Option type="QString" name="Value" value="name"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_printmaps">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_geometry_alt1_used">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_geometry_alt2_used">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_node_type">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_orientation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_schema_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geometry_alt1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geometry_alt2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="update_geometry_alt1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="update_geometry_alt2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="identification">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_distributor">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="distributor20130304114719702"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="name"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_status">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="vl_status20130304110011436"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_folder">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowAddFeatures" value="false"/>
            <Option type="bool" name="AllowNULL" value="true"/>
            <Option type="bool" name="MapIdentification" value="true"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="ReadOnly" value="false"/>
            <Option type="QString" name="Relation" value="relation_hydrant_folder"/>
            <Option type="bool" name="ShowForm" value="false"/>
            <Option type="bool" name="ShowOpenFormButton" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_locationtype">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="true"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="locationtype20150922082741813"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_precision">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="vl_precision20130304110011372"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_precisionalti">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="vl_precisionalti20131211161429510"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_object_reference">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="object_reference20150922083109152"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="altitude">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="year">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="year_end">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="orientation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="remark">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_visible">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="vl_code_int"/>
            <Option type="QString" name="Layer" value="vl_visible20130304110011703"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_rotation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_text">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_visible">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="vl_code_int"/>
            <Option type="QString" name="Layer" value="vl_visible20130304110011703"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_rotation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_text">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_provider">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="hydrant_provider20130304110004893"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_model_sup">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="hydrant_model_sup20160205143014484"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_model_inf">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="hydrant_model_inf20160205143014472"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_material">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="hydrant_material20150925104534891"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_output">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="id"/>
            <Option type="QString" name="Layer" value="hydrant_output20160205143014497"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="value_fr"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="underground">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value=""/>
            <Option type="QString" name="UncheckedState" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="marked">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value=""/>
            <Option type="QString" name="UncheckedState" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pressure_static">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pressure_dynamic">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flow">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="observation_date">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" name="allow_null" value="true"/>
            <Option type="bool" name="calendar_popup" value="false"/>
            <Option type="QString" name="display_format" value="yyyy-MM-dd"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd"/>
            <Option type="bool" name="field_iso_format" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="observation_source">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_vl_active">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_short_fr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_short_en">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_short_ro">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_value_fr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_value_en">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_value_ro">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_description_fr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_description_en">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_description_ro">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_active">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_functional">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_code_sire">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" name="ID" index="0"/>
    <alias field="fk_district" name="Commune" index="1"/>
    <alias field="fk_pressurezone" name="Zone de pression" index="2"/>
    <alias field="fk_printmap" name="" index="3"/>
    <alias field="_printmaps" name="Folios" index="4"/>
    <alias field="_geometry_alt1_used" name="" index="5"/>
    <alias field="_geometry_alt2_used" name="" index="6"/>
    <alias field="_pipe_node_type" name="" index="7"/>
    <alias field="_pipe_orientation" name="" index="8"/>
    <alias field="_pipe_schema_visible" name="" index="9"/>
    <alias field="geometry_alt1" name="" index="10"/>
    <alias field="geometry_alt2" name="" index="11"/>
    <alias field="update_geometry_alt1" name="" index="12"/>
    <alias field="update_geometry_alt2" name="" index="13"/>
    <alias field="identification" name="Identification" index="14"/>
    <alias field="fk_distributor" name="Distributeur" index="15"/>
    <alias field="fk_status" name="État" index="16"/>
    <alias field="fk_folder" name="Dossier technique" index="17"/>
    <alias field="fk_locationtype" name="Emplacement" index="18"/>
    <alias field="fk_precision" name="Précision" index="19"/>
    <alias field="fk_precisionalti" name="Précision alti." index="20"/>
    <alias field="fk_object_reference" name="Pt. de réf." index="21"/>
    <alias field="altitude" name="Altitude" index="22"/>
    <alias field="year" name="Année" index="23"/>
    <alias field="year_end" name="" index="24"/>
    <alias field="orientation" name="" index="25"/>
    <alias field="remark" name="Commentaire" index="26"/>
    <alias field="label_1_visible" name="1/250" index="27"/>
    <alias field="label_1_x" name="" index="28"/>
    <alias field="label_1_y" name="" index="29"/>
    <alias field="label_1_rotation" name="" index="30"/>
    <alias field="label_1_text" name=" " index="31"/>
    <alias field="label_2_visible" name="1/5000" index="32"/>
    <alias field="label_2_x" name="" index="33"/>
    <alias field="label_2_y" name="" index="34"/>
    <alias field="label_2_rotation" name="" index="35"/>
    <alias field="label_2_text" name=" " index="36"/>
    <alias field="fk_provider" name="Fournisseur" index="37"/>
    <alias field="fk_model_sup" name="Modèle sup." index="38"/>
    <alias field="fk_model_inf" name="Modèle inf." index="39"/>
    <alias field="fk_material" name="Matériau" index="40"/>
    <alias field="fk_output" name="Sorties" index="41"/>
    <alias field="underground" name="souterraine" index="42"/>
    <alias field="marked" name="marqué" index="43"/>
    <alias field="pressure_static" name="Pression statique" index="44"/>
    <alias field="pressure_dynamic" name="Pression dynamique" index="45"/>
    <alias field="flow" name="Débit" index="46"/>
    <alias field="observation_date" name="Mesuré le" index="47"/>
    <alias field="observation_source" name="Mesuré par" index="48"/>
    <alias field="status_vl_active" name="" index="49"/>
    <alias field="status_short_fr" name="" index="50"/>
    <alias field="status_short_en" name="" index="51"/>
    <alias field="status_short_ro" name="" index="52"/>
    <alias field="status_value_fr" name="" index="53"/>
    <alias field="status_value_en" name="" index="54"/>
    <alias field="status_value_ro" name="" index="55"/>
    <alias field="status_description_fr" name="" index="56"/>
    <alias field="status_description_en" name="" index="57"/>
    <alias field="status_description_ro" name="" index="58"/>
    <alias field="status_active" name="" index="59"/>
    <alias field="status_functional" name="" index="60"/>
    <alias field="status_code_sire" name="" index="61"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" applyOnUpdate="0" field="id"/>
    <default expression="" applyOnUpdate="0" field="fk_district"/>
    <default expression="" applyOnUpdate="0" field="fk_pressurezone"/>
    <default expression="" applyOnUpdate="0" field="fk_printmap"/>
    <default expression="" applyOnUpdate="0" field="_printmaps"/>
    <default expression="" applyOnUpdate="0" field="_geometry_alt1_used"/>
    <default expression="" applyOnUpdate="0" field="_geometry_alt2_used"/>
    <default expression="" applyOnUpdate="0" field="_pipe_node_type"/>
    <default expression="" applyOnUpdate="0" field="_pipe_orientation"/>
    <default expression="" applyOnUpdate="0" field="_pipe_schema_visible"/>
    <default expression="" applyOnUpdate="0" field="geometry_alt1"/>
    <default expression="" applyOnUpdate="0" field="geometry_alt2"/>
    <default expression="" applyOnUpdate="0" field="update_geometry_alt1"/>
    <default expression="" applyOnUpdate="0" field="update_geometry_alt2"/>
    <default expression="" applyOnUpdate="0" field="identification"/>
    <default expression="" applyOnUpdate="0" field="fk_distributor"/>
    <default expression="" applyOnUpdate="0" field="fk_status"/>
    <default expression="" applyOnUpdate="0" field="fk_folder"/>
    <default expression="" applyOnUpdate="0" field="fk_locationtype"/>
    <default expression="" applyOnUpdate="0" field="fk_precision"/>
    <default expression="" applyOnUpdate="0" field="fk_precisionalti"/>
    <default expression="" applyOnUpdate="0" field="fk_object_reference"/>
    <default expression="" applyOnUpdate="0" field="altitude"/>
    <default expression="" applyOnUpdate="0" field="year"/>
    <default expression="" applyOnUpdate="0" field="year_end"/>
    <default expression="" applyOnUpdate="0" field="orientation"/>
    <default expression="" applyOnUpdate="0" field="remark"/>
    <default expression="" applyOnUpdate="0" field="label_1_visible"/>
    <default expression="" applyOnUpdate="0" field="label_1_x"/>
    <default expression="" applyOnUpdate="0" field="label_1_y"/>
    <default expression="" applyOnUpdate="0" field="label_1_rotation"/>
    <default expression="" applyOnUpdate="0" field="label_1_text"/>
    <default expression="" applyOnUpdate="0" field="label_2_visible"/>
    <default expression="" applyOnUpdate="0" field="label_2_x"/>
    <default expression="" applyOnUpdate="0" field="label_2_y"/>
    <default expression="" applyOnUpdate="0" field="label_2_rotation"/>
    <default expression="" applyOnUpdate="0" field="label_2_text"/>
    <default expression="" applyOnUpdate="0" field="fk_provider"/>
    <default expression="" applyOnUpdate="0" field="fk_model_sup"/>
    <default expression="" applyOnUpdate="0" field="fk_model_inf"/>
    <default expression="" applyOnUpdate="0" field="fk_material"/>
    <default expression="" applyOnUpdate="0" field="fk_output"/>
    <default expression="" applyOnUpdate="0" field="underground"/>
    <default expression="" applyOnUpdate="0" field="marked"/>
    <default expression="" applyOnUpdate="0" field="pressure_static"/>
    <default expression="" applyOnUpdate="0" field="pressure_dynamic"/>
    <default expression="" applyOnUpdate="0" field="flow"/>
    <default expression="" applyOnUpdate="0" field="observation_date"/>
    <default expression="" applyOnUpdate="0" field="observation_source"/>
    <default expression="" applyOnUpdate="0" field="status_vl_active"/>
    <default expression="" applyOnUpdate="0" field="status_short_fr"/>
    <default expression="" applyOnUpdate="0" field="status_short_en"/>
    <default expression="" applyOnUpdate="0" field="status_short_ro"/>
    <default expression="" applyOnUpdate="0" field="status_value_fr"/>
    <default expression="" applyOnUpdate="0" field="status_value_en"/>
    <default expression="" applyOnUpdate="0" field="status_value_ro"/>
    <default expression="" applyOnUpdate="0" field="status_description_fr"/>
    <default expression="" applyOnUpdate="0" field="status_description_en"/>
    <default expression="" applyOnUpdate="0" field="status_description_ro"/>
    <default expression="" applyOnUpdate="0" field="status_active"/>
    <default expression="" applyOnUpdate="0" field="status_functional"/>
    <default expression="" applyOnUpdate="0" field="status_code_sire"/>
  </defaults>
  <constraints>
    <constraint constraints="3" exp_strength="0" notnull_strength="1" field="id" unique_strength="1"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_district" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_pressurezone" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_printmap" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="_printmaps" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="_geometry_alt1_used" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="_geometry_alt2_used" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="_pipe_node_type" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="_pipe_orientation" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="_pipe_schema_visible" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="geometry_alt1" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="geometry_alt2" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="update_geometry_alt1" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="update_geometry_alt2" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="identification" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_distributor" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_status" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_folder" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_locationtype" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_precision" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_precisionalti" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_object_reference" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="altitude" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="year" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="year_end" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="orientation" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="remark" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="label_1_visible" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="label_1_x" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="label_1_y" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="label_1_rotation" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="label_1_text" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="label_2_visible" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="label_2_x" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="label_2_y" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="label_2_rotation" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="label_2_text" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_provider" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_model_sup" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_model_inf" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_material" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="fk_output" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="underground" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="marked" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="pressure_static" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="pressure_dynamic" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="flow" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="observation_date" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="observation_source" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_vl_active" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_short_fr" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_short_en" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_short_ro" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_value_fr" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_value_en" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_value_ro" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_description_fr" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_description_en" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_description_ro" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_active" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_functional" unique_strength="0"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" field="status_code_sire" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="id" exp=""/>
    <constraint desc="" field="fk_district" exp=""/>
    <constraint desc="" field="fk_pressurezone" exp=""/>
    <constraint desc="" field="fk_printmap" exp=""/>
    <constraint desc="" field="_printmaps" exp=""/>
    <constraint desc="" field="_geometry_alt1_used" exp=""/>
    <constraint desc="" field="_geometry_alt2_used" exp=""/>
    <constraint desc="" field="_pipe_node_type" exp=""/>
    <constraint desc="" field="_pipe_orientation" exp=""/>
    <constraint desc="" field="_pipe_schema_visible" exp=""/>
    <constraint desc="" field="geometry_alt1" exp=""/>
    <constraint desc="" field="geometry_alt2" exp=""/>
    <constraint desc="" field="update_geometry_alt1" exp=""/>
    <constraint desc="" field="update_geometry_alt2" exp=""/>
    <constraint desc="" field="identification" exp=""/>
    <constraint desc="" field="fk_distributor" exp=""/>
    <constraint desc="" field="fk_status" exp=""/>
    <constraint desc="" field="fk_folder" exp=""/>
    <constraint desc="" field="fk_locationtype" exp=""/>
    <constraint desc="" field="fk_precision" exp=""/>
    <constraint desc="" field="fk_precisionalti" exp=""/>
    <constraint desc="" field="fk_object_reference" exp=""/>
    <constraint desc="" field="altitude" exp=""/>
    <constraint desc="" field="year" exp=""/>
    <constraint desc="" field="year_end" exp=""/>
    <constraint desc="" field="orientation" exp=""/>
    <constraint desc="" field="remark" exp=""/>
    <constraint desc="" field="label_1_visible" exp=""/>
    <constraint desc="" field="label_1_x" exp=""/>
    <constraint desc="" field="label_1_y" exp=""/>
    <constraint desc="" field="label_1_rotation" exp=""/>
    <constraint desc="" field="label_1_text" exp=""/>
    <constraint desc="" field="label_2_visible" exp=""/>
    <constraint desc="" field="label_2_x" exp=""/>
    <constraint desc="" field="label_2_y" exp=""/>
    <constraint desc="" field="label_2_rotation" exp=""/>
    <constraint desc="" field="label_2_text" exp=""/>
    <constraint desc="" field="fk_provider" exp=""/>
    <constraint desc="" field="fk_model_sup" exp=""/>
    <constraint desc="" field="fk_model_inf" exp=""/>
    <constraint desc="" field="fk_material" exp=""/>
    <constraint desc="" field="fk_output" exp=""/>
    <constraint desc="" field="underground" exp=""/>
    <constraint desc="" field="marked" exp=""/>
    <constraint desc="" field="pressure_static" exp=""/>
    <constraint desc="" field="pressure_dynamic" exp=""/>
    <constraint desc="" field="flow" exp=""/>
    <constraint desc="" field="observation_date" exp=""/>
    <constraint desc="" field="observation_source" exp=""/>
    <constraint desc="" field="status_vl_active" exp=""/>
    <constraint desc="" field="status_short_fr" exp=""/>
    <constraint desc="" field="status_short_en" exp=""/>
    <constraint desc="" field="status_short_ro" exp=""/>
    <constraint desc="" field="status_value_fr" exp=""/>
    <constraint desc="" field="status_value_en" exp=""/>
    <constraint desc="" field="status_value_ro" exp=""/>
    <constraint desc="" field="status_description_fr" exp=""/>
    <constraint desc="" field="status_description_en" exp=""/>
    <constraint desc="" field="status_description_ro" exp=""/>
    <constraint desc="" field="status_active" exp=""/>
    <constraint desc="" field="status_functional" exp=""/>
    <constraint desc="" field="status_code_sire" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="&quot;identification&quot;">
    <columns>
      <column type="field" width="-1" name="identification" hidden="0"/>
      <column type="field" width="-1" name="id" hidden="0"/>
      <column type="field" width="-1" name="fk_district" hidden="0"/>
      <column type="field" width="-1" name="fk_pressurezone" hidden="1"/>
      <column type="field" width="-1" name="fk_printmap" hidden="1"/>
      <column type="field" width="-1" name="_printmaps" hidden="1"/>
      <column type="field" width="-1" name="_geometry_alt1_used" hidden="1"/>
      <column type="field" width="-1" name="_geometry_alt2_used" hidden="1"/>
      <column type="field" width="-1" name="_pipe_node_type" hidden="1"/>
      <column type="field" width="-1" name="_pipe_orientation" hidden="1"/>
      <column type="field" width="-1" name="_pipe_schema_visible" hidden="1"/>
      <column type="field" width="-1" name="geometry_alt1" hidden="1"/>
      <column type="field" width="-1" name="geometry_alt2" hidden="1"/>
      <column type="field" width="-1" name="update_geometry_alt1" hidden="1"/>
      <column type="field" width="-1" name="update_geometry_alt2" hidden="1"/>
      <column type="field" width="-1" name="fk_distributor" hidden="0"/>
      <column type="field" width="-1" name="fk_status" hidden="0"/>
      <column type="field" width="-1" name="fk_folder" hidden="0"/>
      <column type="field" width="-1" name="fk_locationtype" hidden="1"/>
      <column type="field" width="-1" name="year" hidden="0"/>
      <column type="field" width="-1" name="year_end" hidden="0"/>
      <column type="field" width="-1" name="remark" hidden="0"/>
      <column type="field" width="-1" name="label_1_visible" hidden="1"/>
      <column type="field" width="-1" name="label_1_x" hidden="1"/>
      <column type="field" width="-1" name="label_1_y" hidden="1"/>
      <column type="field" width="-1" name="label_1_rotation" hidden="1"/>
      <column type="field" width="-1" name="label_1_text" hidden="1"/>
      <column type="field" width="-1" name="label_2_visible" hidden="1"/>
      <column type="field" width="-1" name="label_2_x" hidden="1"/>
      <column type="field" width="-1" name="label_2_y" hidden="1"/>
      <column type="field" width="-1" name="label_2_rotation" hidden="1"/>
      <column type="field" width="-1" name="label_2_text" hidden="1"/>
      <column type="field" width="-1" name="fk_precision" hidden="1"/>
      <column type="field" width="-1" name="fk_precisionalti" hidden="1"/>
      <column type="field" width="-1" name="fk_object_reference" hidden="1"/>
      <column type="field" width="-1" name="altitude" hidden="0"/>
      <column type="field" width="-1" name="orientation" hidden="1"/>
      <column type="field" width="-1" name="fk_provider" hidden="1"/>
      <column type="field" width="-1" name="fk_material" hidden="1"/>
      <column type="field" width="-1" name="underground" hidden="0"/>
      <column type="field" width="-1" name="marked" hidden="0"/>
      <column type="field" width="-1" name="pressure_static" hidden="0"/>
      <column type="field" width="-1" name="pressure_dynamic" hidden="0"/>
      <column type="field" width="-1" name="flow" hidden="0"/>
      <column type="field" width="-1" name="observation_date" hidden="1"/>
      <column type="field" width="-1" name="observation_source" hidden="1"/>
      <column type="field" width="-1" name="fk_model_sup" hidden="0"/>
      <column type="field" width="-1" name="fk_model_inf" hidden="0"/>
      <column type="field" width="-1" name="fk_output" hidden="0"/>
      <column type="field" width="-1" name="status_vl_active" hidden="1"/>
      <column type="field" width="-1" name="status_short_fr" hidden="1"/>
      <column type="field" width="-1" name="status_short_en" hidden="1"/>
      <column type="field" width="-1" name="status_short_ro" hidden="1"/>
      <column type="field" width="-1" name="status_value_fr" hidden="1"/>
      <column type="field" width="-1" name="status_value_en" hidden="1"/>
      <column type="field" width="-1" name="status_value_ro" hidden="1"/>
      <column type="field" width="-1" name="status_description_fr" hidden="1"/>
      <column type="field" width="-1" name="status_description_en" hidden="1"/>
      <column type="field" width="-1" name="status_description_ro" hidden="1"/>
      <column type="field" width="-1" name="status_active" hidden="1"/>
      <column type="field" width="-1" name="status_code_sire" hidden="1"/>
      <column type="actions" width="-1" hidden="1"/>
      <column type="field" width="-1" name="status_functional" hidden="0"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">/home/lbartoletti/QWAT/qgis-project/ui_forms/hydrant.ui</editform>
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
    <attributeEditorContainer columnCount="2" visibilityExpressionEnabled="0" visibilityExpression="" name="Général" showLabel="1" groupBox="0">
      <attributeEditorField name="id" showLabel="1" index="0"/>
      <attributeEditorField name="fk_distributor" showLabel="1" index="15"/>
      <attributeEditorField name="identification" showLabel="1" index="14"/>
      <attributeEditorField name="fk_status" showLabel="1" index="16"/>
      <attributeEditorField name="fk_folder" showLabel="1" index="17"/>
      <attributeEditorField name="year" showLabel="1" index="23"/>
      <attributeEditorField name="fk_model_sup" showLabel="1" index="38"/>
      <attributeEditorField name="fk_model_inf" showLabel="1" index="39"/>
      <attributeEditorField name="underground" showLabel="1" index="42"/>
      <attributeEditorField name="marked" showLabel="1" index="43"/>
      <attributeEditorField name="fk_provider" showLabel="1" index="37"/>
      <attributeEditorField name="fk_output" showLabel="1" index="41"/>
      <attributeEditorField name="fk_material" showLabel="1" index="40"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="2" visibilityExpressionEnabled="0" visibilityExpression="" name="Géométrie" showLabel="1" groupBox="0">
      <attributeEditorField name="altitude" showLabel="1" index="22"/>
      <attributeEditorField name="_printmaps" showLabel="1" index="4"/>
      <attributeEditorField name="fk_precisionalti" showLabel="1" index="20"/>
      <attributeEditorField name="fk_district" showLabel="1" index="1"/>
      <attributeEditorField name="fk_object_reference" showLabel="1" index="21"/>
      <attributeEditorField name="fk_pressurezone" showLabel="1" index="2"/>
      <attributeEditorField name="fk_precision" showLabel="1" index="19"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="2" visibilityExpressionEnabled="0" visibilityExpression="" name="Rendu" showLabel="1" groupBox="0">
      <attributeEditorField name="label_1_visible" showLabel="1" index="27"/>
      <attributeEditorField name="label_1_text" showLabel="0" index="31"/>
      <attributeEditorField name="label_2_visible" showLabel="1" index="32"/>
      <attributeEditorField name="label_2_text" showLabel="1" index="36"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" visibilityExpressionEnabled="0" visibilityExpression="" name="Hydraulique" showLabel="1" groupBox="0">
      <attributeEditorField name="pressure_static" showLabel="1" index="44"/>
      <attributeEditorField name="pressure_dynamic" showLabel="1" index="45"/>
      <attributeEditorField name="flow" showLabel="1" index="46"/>
      <attributeEditorField name="observation_date" showLabel="1" index="47"/>
      <attributeEditorField name="observation_source" showLabel="1" index="48"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" visibilityExpressionEnabled="0" visibilityExpression="" name="Emplacement" showLabel="1" groupBox="0">
      <attributeEditorField name="fk_locationtype" showLabel="1" index="18"/>
    </attributeEditorContainer>
    <attributeEditorField name="remark" showLabel="0" index="26"/>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="_geometry_alt1_used"/>
    <field editable="1" name="_geometry_alt2_used"/>
    <field editable="1" name="_pipe_node_type"/>
    <field editable="1" name="_pipe_orientation"/>
    <field editable="1" name="_pipe_schema_visible"/>
    <field editable="1" name="_printmaps"/>
    <field editable="1" name="altitude"/>
    <field editable="1" name="fk_distributor"/>
    <field editable="1" name="fk_district"/>
    <field editable="1" name="fk_folder"/>
    <field editable="1" name="fk_locationtype"/>
    <field editable="1" name="fk_material"/>
    <field editable="1" name="fk_model_inf"/>
    <field editable="1" name="fk_model_sup"/>
    <field editable="1" name="fk_object_reference"/>
    <field editable="1" name="fk_output"/>
    <field editable="1" name="fk_precision"/>
    <field editable="1" name="fk_precisionalti"/>
    <field editable="1" name="fk_pressurezone"/>
    <field editable="1" name="fk_printmap"/>
    <field editable="1" name="fk_provider"/>
    <field editable="1" name="fk_status"/>
    <field editable="1" name="flow"/>
    <field editable="1" name="geometry_alt1"/>
    <field editable="1" name="geometry_alt2"/>
    <field editable="1" name="id"/>
    <field editable="1" name="identification"/>
    <field editable="1" name="label_1_rotation"/>
    <field editable="1" name="label_1_text"/>
    <field editable="1" name="label_1_visible"/>
    <field editable="1" name="label_1_x"/>
    <field editable="1" name="label_1_y"/>
    <field editable="1" name="label_2_rotation"/>
    <field editable="1" name="label_2_text"/>
    <field editable="1" name="label_2_visible"/>
    <field editable="1" name="label_2_x"/>
    <field editable="1" name="label_2_y"/>
    <field editable="1" name="marked"/>
    <field editable="1" name="observation_date"/>
    <field editable="1" name="observation_source"/>
    <field editable="1" name="orientation"/>
    <field editable="1" name="pressure_dynamic"/>
    <field editable="1" name="pressure_static"/>
    <field editable="1" name="remark"/>
    <field editable="0" name="status_active"/>
    <field editable="0" name="status_code_sire"/>
    <field editable="0" name="status_description_en"/>
    <field editable="0" name="status_description_fr"/>
    <field editable="0" name="status_description_ro"/>
    <field editable="0" name="status_functional"/>
    <field editable="0" name="status_short_en"/>
    <field editable="0" name="status_short_fr"/>
    <field editable="0" name="status_short_ro"/>
    <field editable="0" name="status_value_en"/>
    <field editable="0" name="status_value_fr"/>
    <field editable="0" name="status_value_ro"/>
    <field editable="0" name="status_vl_active"/>
    <field editable="1" name="underground"/>
    <field editable="1" name="update_geometry_alt1"/>
    <field editable="1" name="update_geometry_alt2"/>
    <field editable="1" name="year"/>
    <field editable="1" name="year_end"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="_geometry_alt1_used"/>
    <field labelOnTop="0" name="_geometry_alt2_used"/>
    <field labelOnTop="0" name="_pipe_node_type"/>
    <field labelOnTop="0" name="_pipe_orientation"/>
    <field labelOnTop="0" name="_pipe_schema_visible"/>
    <field labelOnTop="0" name="_printmaps"/>
    <field labelOnTop="0" name="altitude"/>
    <field labelOnTop="0" name="fk_distributor"/>
    <field labelOnTop="0" name="fk_district"/>
    <field labelOnTop="0" name="fk_folder"/>
    <field labelOnTop="0" name="fk_locationtype"/>
    <field labelOnTop="0" name="fk_material"/>
    <field labelOnTop="0" name="fk_model_inf"/>
    <field labelOnTop="0" name="fk_model_sup"/>
    <field labelOnTop="0" name="fk_object_reference"/>
    <field labelOnTop="0" name="fk_output"/>
    <field labelOnTop="0" name="fk_precision"/>
    <field labelOnTop="0" name="fk_precisionalti"/>
    <field labelOnTop="0" name="fk_pressurezone"/>
    <field labelOnTop="0" name="fk_printmap"/>
    <field labelOnTop="0" name="fk_provider"/>
    <field labelOnTop="0" name="fk_status"/>
    <field labelOnTop="0" name="flow"/>
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
    <field labelOnTop="0" name="marked"/>
    <field labelOnTop="0" name="observation_date"/>
    <field labelOnTop="0" name="observation_source"/>
    <field labelOnTop="0" name="orientation"/>
    <field labelOnTop="0" name="pressure_dynamic"/>
    <field labelOnTop="0" name="pressure_static"/>
    <field labelOnTop="0" name="remark"/>
    <field labelOnTop="0" name="status_active"/>
    <field labelOnTop="0" name="status_code_sire"/>
    <field labelOnTop="0" name="status_description_en"/>
    <field labelOnTop="0" name="status_description_fr"/>
    <field labelOnTop="0" name="status_description_ro"/>
    <field labelOnTop="0" name="status_functional"/>
    <field labelOnTop="0" name="status_short_en"/>
    <field labelOnTop="0" name="status_short_fr"/>
    <field labelOnTop="0" name="status_short_ro"/>
    <field labelOnTop="0" name="status_value_en"/>
    <field labelOnTop="0" name="status_value_fr"/>
    <field labelOnTop="0" name="status_value_ro"/>
    <field labelOnTop="0" name="status_vl_active"/>
    <field labelOnTop="0" name="underground"/>
    <field labelOnTop="0" name="update_geometry_alt1"/>
    <field labelOnTop="0" name="update_geometry_alt2"/>
    <field labelOnTop="0" name="year"/>
    <field labelOnTop="0" name="year_end"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>COALESCE( "id", '&lt;NULL>' )</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
