<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" readOnly="0" labelsEnabled="1" minScale="1e+08" simplifyDrawingTol="1" styleCategories="AllStyleCategories" simplifyLocal="1" simplifyMaxScale="1" simplifyAlgorithm="0" version="3.4.7-Madeira" simplifyDrawingHints="0" maxScale="100000">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="RuleRenderer" symbollevels="0" forceraster="0" enableorderby="0">
    <rules key="{89d1d7f3-6dd2-48ab-a978-572c899af422}">
      <rule label="fonctionnel" key="{69b3bf49-4ced-4bb9-8799-da2f168ad22c}" filter="fk_distributor = 1 AND status_functional= 'true'">
        <rule label="actif" key="{6f043e9f-1731-47a8-86d1-a6084a99e57b}" filter="status_active= 'true' AND (fk_parent IS NULL OR @map_scale &lt; 501)">
          <rule label="Chambre" key="{e50fbbc2-a891-4432-a846-34d4f3e99c86}" filter="installation_type = 'chamber'">
            <rule label="Chambre débitmètre" key="{c5aa7421-12d9-4e1f-b39e-ddc5f7c287e9}" symbol="0" filter="flow_meter= 'true' or water_meter= 'true' or manometer= 'true'"/>
            <rule label="Chambre" key="{278ef659-c656-449d-a1c5-7c60acabaa65}" symbol="1" filter="ELSE"/>
          </rule>
          <rule label="pressurecontrol" key="{dcad679b-71a0-497e-b02e-93f46651826b}" filter="installation_type = 'pressurecontrol'">
            <rule label="Chambre réducteur" key="{980ea4bf-d999-4d98-b45a-9c3890a64496}" symbol="2" filter=" &quot;fk_pressurecontrol_type&quot; =  2801 "/>
            <rule label="Chambre coupe pression" key="{37877255-94b0-449e-ae98-71803ed4ef1c}" symbol="3" filter=" &quot;fk_pressurecontrol_type&quot; =  2802"/>
            <rule label="Chambre de rassemblement" key="{7e777116-29bb-4af3-883d-504a8f109298}" symbol="4" filter=" &quot;fk_pressurecontrol_type&quot; =  2803"/>
          </rule>
          <rule label="pump" key="{3c04b823-cf69-4ac1-89cf-d04e9bdd4989}" symbol="5" filter="installation_type = 'pump'"/>
          <rule label="source" key="{6be86ca3-25cf-47e9-a4d8-09d481490c9c}" symbol="6" filter="installation_type = 'source'"/>
          <rule label="tank" key="{cdead7aa-d728-472d-b382-91cf70fd6e5f}" symbol="7" filter="installation_type = 'tank'"/>
          <rule label="treatment" key="{a841e611-3390-4ae1-b9f5-e7fee4fea027}" symbol="8" filter="installation_type = 'treatment'"/>
          <rule key="{5d01efe9-2c1b-4052-a11f-5ce82dd09f65}" symbol="9" filter="ELSE"/>
        </rule>
        <rule label="inactif" key="{f955cc23-5f5f-4ac6-949b-6711a8862c7a}" filter="status_active= 'false' AND (fk_parent IS NULL OR @map_scale &lt; 501)">
          <rule label="Chambre" key="{33dee9ac-9240-41d9-8da7-d047d8521f65}" filter="installation_type = 'chamber'">
            <rule label="Chambre débitmètre" key="{b30d473c-b7f4-448a-b647-b2a5ceb1a131}" symbol="10" filter="flow_meter= 'true' or water_meter= 'true' or manometer= 'true'"/>
            <rule label="Chambre" key="{ee6ec74f-d3e1-435a-90d0-b91da4a9537f}" symbol="11" filter="ELSE"/>
          </rule>
          <rule label="pressurecontrol" key="{dc540c42-11d4-4a71-a720-5c18f763734e}" filter="installation_type = 'pressurecontrol'">
            <rule label="Chambre réducteur" key="{e2eb5440-e94b-4c54-a2bc-91b66b6e2c21}" symbol="12" filter=" &quot;fk_pressurecontrol_type&quot; =  2801 "/>
            <rule label="Chambre coupe pression" key="{a36e1dd4-a5ba-4a46-8647-4b6ecf6a4e58}" symbol="13" filter=" &quot;fk_pressurecontrol_type&quot; =  2802"/>
            <rule label="Chambre de rassemblement" key="{5fb13620-50f9-41de-93f9-9ab384ab087f}" symbol="14" filter=" &quot;fk_pressurecontrol_type&quot; =  2803"/>
          </rule>
          <rule label="pump" key="{082eff42-4984-492f-97dc-caedb6a17a07}" symbol="15" filter="installation_type = 'pump'"/>
          <rule label="source" key="{a6946f96-07f0-4f35-aa70-ad33d6866b8d}" symbol="16" filter="installation_type = 'source'"/>
          <rule label="tank" key="{ffab370b-cfc7-4704-9929-5e4dd09ee8f3}" symbol="17" filter="installation_type = 'tank'"/>
          <rule label="treatment" key="{224820ff-9d97-46ba-88a8-8073f0a09a29}" symbol="18" filter="installation_type = 'treatment'"/>
          <rule key="{0b8281d6-7c39-44b5-8a40-ecb1889399cb}" symbol="19" filter="ELSE"/>
        </rule>
      </rule>
      <rule label="non fonctionnel" key="{1a64d4d9-3bd2-437b-9620-740b13e32509}" filter="fk_distributor = 1 AND status_functional= 'false'">
        <rule label="Chambre" key="{ce0c94bb-b016-41a1-931c-3109807689b0}" filter="installation_type = 'chamber'">
          <rule label="Chambre débitmètre" key="{f16643c2-ce75-4f94-beee-56389f55aee7}" symbol="20" filter="flow_meter= 'true' or water_meter= 'true' or manometer= 'true'"/>
          <rule label="Chambre" key="{8366c510-1142-41fb-85a1-bf9663ad9d11}" symbol="21" filter="ELSE"/>
        </rule>
        <rule label="pressurecontrol" key="{d31ae609-73ec-4d88-8324-5300f14ed738}" filter="installation_type = 'pressurecontrol'">
          <rule label="Chambre réducteur" key="{5b2d8e5a-3356-4b07-b16a-4d65880b37be}" symbol="22" filter=" &quot;fk_pressurecontrol_type&quot; =  2801 "/>
          <rule label="Chambre coupe pression" key="{58ca52b5-c570-46bb-a8d6-37620ad6dfdd}" symbol="23" filter=" &quot;fk_pressurecontrol_type&quot; =  2802"/>
          <rule label="Chambre de rassemblement" key="{e5d0325a-e0da-4e48-9d56-e1af3d322a7c}" symbol="24" filter=" &quot;fk_pressurecontrol_type&quot; =  2803"/>
        </rule>
        <rule label="pump" key="{53d7b7ef-bd10-4993-87fd-3d4573cd83ce}" symbol="25" filter="installation_type = 'pump'"/>
        <rule label="source" key="{18febfc6-d9a9-4440-bee8-fa580f8b5d76}" symbol="26" filter="installation_type = 'source'"/>
        <rule label="tank" key="{006b8eb0-9edd-4fe7-8811-9db931679b5f}" symbol="27" filter="installation_type = 'tank'"/>
        <rule label="treatment" key="{d9e91fdc-4236-40c2-9a43-470f8c8503cf}" symbol="28" filter="installation_type = 'treatment'"/>
        <rule key="{502f5a4d-e6dd-456d-9170-febbacdf05b8}" symbol="29" filter="ELSE"/>
      </rule>
      <rule label="étranger" key="{05336f6d-543d-4bf7-bea5-a474d431bdf3}" filter="fk_distributor != 1">
        <rule label="Chambre" key="{8beaf9ba-e486-46ce-8f70-957911d5515b}" filter="installation_type = 'chamber'">
          <rule label="Chambre débitmètre" key="{5f09c1ec-36a2-4dba-98f0-bcd568e24533}" symbol="30" filter="flow_meter= 'true' or water_meter= 'true' or manometer= 'true'"/>
          <rule label="Chambre" key="{a6204137-028d-44b7-b245-5d3b24a7d399}" symbol="31" filter="ELSE"/>
        </rule>
        <rule label="pressurecontrol" key="{94454820-5d27-4427-80f6-24d28c5c51a3}" filter="installation_type = 'pressurecontrol'">
          <rule label="Chambre réducteur" key="{d2372040-fe4c-4b5f-8432-b8fe2a68d576}" symbol="32" filter=" &quot;fk_pressurecontrol_type&quot; =  2801 "/>
          <rule label="Chambre coupe pression" key="{9402cda0-5af5-4a12-8353-366c479faed7}" symbol="33" filter=" &quot;fk_pressurecontrol_type&quot; =  2802"/>
          <rule label="Chambre de rassemblement" key="{318b69f6-b284-41b7-aa22-bdf34451d264}" symbol="34" filter=" &quot;fk_pressurecontrol_type&quot; =  2803"/>
        </rule>
        <rule label="pump" key="{c43ff5da-3940-4343-ba73-5421a97e3150}" symbol="35" filter="installation_type = 'pump'"/>
        <rule label="source" key="{79439a36-597f-4775-89a8-7c072e5beef5}" symbol="36" filter="installation_type = 'source'"/>
        <rule label="tank" key="{2da4b3f5-47c6-44d2-8e96-2a0b70b6ad15}" symbol="37" filter="installation_type = 'tank'"/>
        <rule label="treatment" key="{da2a0958-a57b-43fc-9c43-8725b703dedc}" symbol="38" filter="installation_type = 'treatment'"/>
        <rule key="{95c23bff-05b6-444b-ba53-a19d85aec669}" symbol="39" filter="ELSE"/>
      </rule>
    </rules>
    <symbols>
      <symbol name="0" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/meter.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="255,255,255,255"/>
          <prop k="outline_width" v="1"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="fillColor" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="'[0,0,0]'" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
                <Option name="outlineColor" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="'[0,0,0]'" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="1" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/chamber.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="255,255,255,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="10" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/meter.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="1"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="11" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/chamber.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="12" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/reduction.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="13" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pressurebreak.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="14" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/gathering.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="fillColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="'[227,26,0]'" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
                <Option name="outlineColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="'[227,26,0]'" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="15" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pump.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="16" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/source.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="17" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/tank.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="fillColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="@color_inactive" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
                <Option name="outlineColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="@color_inactive" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="18" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/treatment.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="19" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="238,208,136,255"/>
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
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="2" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/reduction.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="255,255,255,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="20" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/meter.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="1"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="21" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/chamber.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="22" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/reduction.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="23" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pressurebreak.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="24" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/gathering.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="fillColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="'[227,26,0]'" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
                <Option name="outlineColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="'[227,26,0]'" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="25" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pump.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="26" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/source.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="27" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/tank.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="fillColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="@color_inactive" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
                <Option name="outlineColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="@color_inactive" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="28" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/treatment.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="29" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="238,208,136,255"/>
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
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="3" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pressurebreak.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="255,255,255,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="30" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="40,180,16,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/meter.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="1"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="31" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="40,180,16,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/chamber.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="32" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/reduction.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="33" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="227,26,28,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pressurebreak.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="34" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/gathering.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="fillColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="'[227,26,0]'" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
                <Option name="outlineColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="'[227,26,0]'" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="35" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="40,180,16,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pump.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="36" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="40,180,16,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/source.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="40,180,16,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="37" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="40,180,16,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/tank.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="40,180,16,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="fillColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="@color_inactive" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
                <Option name="outlineColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="@color_inactive" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="38" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="40,180,16,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/treatment.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="40,180,16,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="39" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="238,208,136,255"/>
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
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="4" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/gathering.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineColor" type="Map">
                  <Option name="active" value="false" type="bool"/>
                  <Option name="expression" value="'[255,100,0]'" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="5" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pump.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="6" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/source.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="7" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/tank.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="255,255,255,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="8" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="name" v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/treatment.svg"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="9" type="marker" clip_to_extent="1" force_rhr="0" alpha="1">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="238,208,136,255"/>
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
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="simple">
    <settings>
      <text-style fontWeight="50" multilineHeight="1" fontLetterSpacing="0" fontWordSpacing="0" textOpacity="1" textColor="0,0,0,255" previewBkgrdColor="#ffffff" isExpression="1" fontSize="11" namedStyle="Normal" fontUnderline="0" fieldName="CASE&#xa;WHEN  &quot;installation_type&quot;  = 'chamber' THEN 'C. '&#xa;WHEN &quot;installation_type&quot;  = 'pressurecontrol' AND fk_pressurecontrol_type = 2801 THEN 'CR. '&#xa;WHEN  &quot;installation_type&quot;  = 'pressurecontrol' AND fk_pressurecontrol_type = 2802 THEN 'CCP. ' &#xa;WHEN  &quot;installation_type&quot;  = 'pressurecontrol' AND fk_pressurecontrol_type = 2803 THEN 'CRA. '&#xa;WHEN  &quot;installation_type&quot;  = 'pump' THEN 'P. ' &#xa;WHEN  &quot;installation_type&quot;  = 'source' THEN 'S. ' &#xa;WHEN  &quot;installation_type&quot;  = 'tank' THEN 'R. '&#xa;WHEN  &quot;installation_type&quot;  = 'treatment' THEN 'T. '&#xa;ELSE '' &#xa;END&#xa;|| coalesce(name, '')" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontItalic="0" blendMode="0" fontStrikeout="0" useSubstitutions="0" fontFamily="Sans Serif" fontSizeUnit="Point" fontCapitals="0">
        <text-buffer bufferSizeUnits="MM" bufferOpacity="1" bufferBlendMode="0" bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="0" bufferDraw="1" bufferColor="255,255,255,255" bufferJoinStyle="64"/>
        <background shapeJoinStyle="64" shapeSizeType="0" shapeOffsetUnit="MM" shapeType="0" shapeFillColor="255,255,255,255" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeSizeX="0" shapeRadiiUnit="MM" shapeOffsetY="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBorderColor="128,128,128,255" shapeBlendMode="0" shapeBorderWidthUnit="MM" shapeOpacity="1" shapeRotationType="0" shapeSVGFile="" shapeRadiiX="0" shapeSizeY="0" shapeDraw="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeRotation="0" shapeSizeUnit="MM"/>
        <shadow shadowRadius="1.5" shadowScale="100" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusAlphaOnly="0" shadowDraw="0" shadowColor="0,0,0,255" shadowBlendMode="6" shadowUnder="0" shadowRadiusUnit="MM" shadowOffsetAngle="135" shadowOpacity="0.7"/>
        <substitutions/>
      </text-style>
      <text-format multilineAlign="1" autoWrapLength="0" placeDirectionSymbol="0" addDirectionSymbol="0" useMaxLineLengthForAutoWrap="1" plussign="0" wrapChar="" rightDirectionSymbol=">" decimals="3" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0"/>
      <placement repeatDistanceUnits="MM" maxCurvedCharAngleOut="-20" dist="3" centroidWhole="0" centroidInside="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" placementFlags="10" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" distMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" fitInPolygonOnly="0" placement="0" offsetUnits="MapUnit" maxCurvedCharAngleIn="20" preserveRotation="1" rotationAngle="0" offsetType="0" yOffset="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" xOffset="0" quadOffset="4" repeatDistance="0" priority="5"/>
      <rendering obstacleFactor="1" fontMinPixelSize="3" fontMaxPixelSize="10000" upsidedownLabels="0" obstacle="1" fontLimitPixelSize="0" obstacleType="0" labelPerPart="0" scaleMax="10000" limitNumLabels="0" zIndex="0" scaleVisibility="1" displayAll="1" mergeLines="0" scaleMin="1" minFeatureSize="0" maxNumLabels="2000" drawLabels="1"/>
      <dd_properties>
        <Option type="Map">
          <Option name="name" value="" type="QString"/>
          <Option name="properties" type="Map">
            <Option name="LabelRotation" type="Map">
              <Option name="active" value="true" type="bool"/>
              <Option name="expression" value="360 - (&quot;label_1_rotation&quot;)" type="QString"/>
              <Option name="type" value="3" type="int"/>
            </Option>
            <Option name="PositionX" type="Map">
              <Option name="active" value="true" type="bool"/>
              <Option name="field" value="label_1_x" type="QString"/>
              <Option name="type" value="2" type="int"/>
            </Option>
            <Option name="PositionY" type="Map">
              <Option name="active" value="true" type="bool"/>
              <Option name="field" value="label_1_y" type="QString"/>
              <Option name="type" value="2" type="int"/>
            </Option>
          </Option>
          <Option name="type" value="collection" type="QString"/>
        </Option>
      </dd_properties>
    </settings>
  </labeling>
  <customproperties>
    <property value="coalesce(identification|| ' ','') || CASE&#xa;WHEN  &quot;installation_type&quot;  = 'chamber' THEN 'C. '&#xa;WHEN &quot;installation_type&quot;  = 'pressurecontrol' AND fk_pressurecontrol_type = 2801 THEN 'CR. '&#xa;WHEN  &quot;installation_type&quot;  = 'pressurecontrol' AND fk_pressurecontrol_type = 2802 THEN 'CCP. '&#xa;WHEN  &quot;installation_type&quot;  = 'pressurecontrol' AND fk_pressurecontrol_type = 2803 THEN 'CRA. '&#xa;WHEN  &quot;installation_type&quot;  = 'pump' THEN 'P. '&#xa;WHEN  &quot;installation_type&quot;  = 'source' THEN 'S. '&#xa;WHEN  &quot;installation_type&quot;  = 'tank' THEN 'R. '&#xa;WHEN  &quot;installation_type&quot;  = 'treatment' THEN 'T. '&#xa;ELSE ''&#xa;END&#xa;|| coalesce(name,'')" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Pie" attributeLegend="1">
    <DiagramCategory opacity="1" diagramOrientation="Up" backgroundColor="#ffffff" labelPlacementMethod="XHeight" backgroundAlpha="255" penAlpha="255" sizeType="MM" barWidth="5" height="15" lineSizeScale="3x:0,0,0,0,0,0" penColor="#000000" enabled="0" scaleBasedVisibility="0" penWidth="0" minScaleDenominator="100000" maxScaleDenominator="1e+08" scaleDependency="Area" sizeScale="3x:0,0,0,0,0,0" lineSizeType="MM" minimumSize="0" rotationOffset="270" width="15">
      <fontProperties description="Cantarell,11,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" field="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" showAll="1" placement="0" priority="0" obstacle="0" zIndex="0" linePlacementFlags="2">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties" type="Map">
          <Option name="show" type="Map">
            <Option name="active" value="true" type="bool"/>
            <Option name="field" value="id" type="QString"/>
            <Option name="type" value="2" type="int"/>
          </Option>
        </Option>
        <Option name="type" value="collection" type="QString"/>
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
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_district">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="district20130304110004764" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="name" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pressurezone">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="0" type="QString"/>
            <Option name="AllowNull" value="0" type="QString"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="pressurezone20130417133612105" type="QString"/>
            <Option name="OrderByValue" value="0" type="QString"/>
            <Option name="UseCompleter" value="0" type="QString"/>
            <Option name="Value" value="name" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_printmap">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_printmaps">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_geometry_alt1_used">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_geometry_alt2_used">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_node_type">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_orientation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_schema_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geometry_alt1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geometry_alt2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="update_geometry_alt1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="update_geometry_alt2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="identification">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_distributor">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="distributor20130304114719702" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="name" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_status">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="vl_status20130304110011436" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_folder">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_locationtype">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="true" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="locationtype20150922082741813" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_precision">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="vl_precision20130304110011372" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_precisionalti">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="vl_precisionalti20131211161429510" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_object_reference">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="object_reference20150922083109152" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="altitude">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="year">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="year_end">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="orientation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="remark">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="true" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_rotation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_text">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_rotation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_text">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="installation_type">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="List">
              <Option type="Map">
                <Option name="chambre" value="chamber" type="QString"/>
              </Option>
              <Option type="Map">
                <Option name="pompage" value="pump" type="QString"/>
              </Option>
              <Option type="Map">
                <Option name="régulation de pression" value="pressurecontrol" type="QString"/>
              </Option>
              <Option type="Map">
                <Option name="réservoir" value="tank" type="QString"/>
              </Option>
              <Option type="Map">
                <Option name="source" value="source" type="QString"/>
              </Option>
              <Option type="Map">
                <Option name="traitement" value="treatment" type="QString"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_parent">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option name="AllowAddFeatures" value="false" type="bool"/>
            <Option name="AllowNULL" value="true" type="bool"/>
            <Option name="MapIdentification" value="true" type="bool"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="ReadOnly" value="false" type="bool"/>
            <Option name="Relation" value="relation_installation_parent" type="QString"/>
            <Option name="ShowForm" value="false" type="bool"/>
            <Option name="ShowOpenFormButton" value="true" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_remote">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="remote_type20130304110004987" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_watertype">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="vl_watertype20131217141603877" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="parcel">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="eca">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="open_water_surface">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geometry_polygon">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="networkseparation">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flow_meter">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="water_meter">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="manometer">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="depth">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="no_valves">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="Max" value="999" type="int"/>
            <Option name="Min" value="0" type="int"/>
            <Option name="Precision" value="0" type="int"/>
            <Option name="Step" value="1" type="int"/>
            <Option name="Style" value="SpinBox" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pressurecontrol_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="pressurecontrol_type20150203100321270" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pump_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="vl_pumptype20130816140237776" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pipe_in">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option name="AllowAddFeatures" value="false" type="bool"/>
            <Option name="AllowNULL" value="true" type="bool"/>
            <Option name="MapIdentification" value="true" type="bool"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="ReadOnly" value="true" type="bool"/>
            <Option name="Relation" value="relation_pump_pipe_in" type="QString"/>
            <Option name="ShowForm" value="false" type="bool"/>
            <Option name="ShowOpenFormButton" value="true" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pipe_out">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option name="AllowAddFeatures" value="false" type="bool"/>
            <Option name="AllowNULL" value="true" type="bool"/>
            <Option name="MapIdentification" value="true" type="bool"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="ReadOnly" value="true" type="bool"/>
            <Option name="Relation" value="relation_pump_pipe_out" type="QString"/>
            <Option name="ShowForm" value="false" type="bool"/>
            <Option name="ShowOpenFormButton" value="true" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pump_operating">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="pump_operating20150922083814587" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="no_pumps">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="Max" value="99" type="int"/>
            <Option name="Min" value="0" type="int"/>
            <Option name="Precision" value="0" type="int"/>
            <Option name="Step" value="1" type="int"/>
            <Option name="Style" value="SpinBox" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rejected_flow">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="manometric_height">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_source_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="vl_sourcetype20130820110518791" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_source_quality">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="vl_sourcequality20130820110518810" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flow_lowest">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flow_average">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flow_concession">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contract_end">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" value="true" type="bool"/>
            <Option name="calendar_popup" value="true" type="bool"/>
            <Option name="display_format" value="yyyy-MM-dd" type="QString"/>
            <Option name="field_format" value="yyyy-MM-dd" type="QString"/>
            <Option name="field_iso_format" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="gathering_chamber">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_overflow">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="vl_overflow20130304170704046" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_tank_firestorage">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="false" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="vl_tank_firestorage20130304170704030" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="storage_total">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="storage_supply">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="storage_fire">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="altitude_overflow">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="altitude_apron">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="height_max">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fire_valve">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fire_remote">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_litrepercm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern1_fk_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="vl_cistern20130304110005061" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern1_dimension_1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern1_dimension_2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern1_storage">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_cistern1_litrepercm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern2_fk_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="id" type="QString"/>
            <Option name="Layer" value="vl_cistern20130304110005061" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="value_fr" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern2_dimension_1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern2_dimension_2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern2_storage">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_cistern2_litrepercm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sanitization_uv">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sanitization_chlorine_liquid">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sanitization_chlorine_gas">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sanitization_ozone">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="filtration_membrane">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="filtration_sandorgravel">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flocculation">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="activatedcharcoal">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="settling">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="" type="QString"/>
            <Option name="UncheckedState" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="treatment_capacity">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_active">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_functional">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_installation_type_short">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="ID" field="id" index="0"/>
    <alias name="" field="fk_district" index="1"/>
    <alias name="" field="fk_pressurezone" index="2"/>
    <alias name="" field="fk_printmap" index="3"/>
    <alias name="" field="_printmaps" index="4"/>
    <alias name="" field="_geometry_alt1_used" index="5"/>
    <alias name="" field="_geometry_alt2_used" index="6"/>
    <alias name="" field="_pipe_node_type" index="7"/>
    <alias name="" field="_pipe_orientation" index="8"/>
    <alias name="" field="_pipe_schema_visible" index="9"/>
    <alias name="" field="geometry_alt1" index="10"/>
    <alias name="" field="geometry_alt2" index="11"/>
    <alias name="" field="update_geometry_alt1" index="12"/>
    <alias name="" field="update_geometry_alt2" index="13"/>
    <alias name="Identification" field="identification" index="14"/>
    <alias name="Distributeur" field="fk_distributor" index="15"/>
    <alias name="Status" field="fk_status" index="16"/>
    <alias name="" field="fk_folder" index="17"/>
    <alias name="" field="fk_locationtype" index="18"/>
    <alias name="Précision" field="fk_precision" index="19"/>
    <alias name="Précision alti." field="fk_precisionalti" index="20"/>
    <alias name="Pt. de réf." field="fk_object_reference" index="21"/>
    <alias name="Altitude" field="altitude" index="22"/>
    <alias name="Année" field="year" index="23"/>
    <alias name="Année fin" field="year_end" index="24"/>
    <alias name="" field="orientation" index="25"/>
    <alias name="Commentaire" field="remark" index="26"/>
    <alias name="" field="label_1_visible" index="27"/>
    <alias name="" field="label_1_x" index="28"/>
    <alias name="" field="label_1_y" index="29"/>
    <alias name="" field="label_1_rotation" index="30"/>
    <alias name="" field="label_1_text" index="31"/>
    <alias name="" field="label_2_visible" index="32"/>
    <alias name="" field="label_2_x" index="33"/>
    <alias name="" field="label_2_y" index="34"/>
    <alias name="" field="label_2_rotation" index="35"/>
    <alias name="" field="label_2_text" index="36"/>
    <alias name="Type" field="installation_type" index="37"/>
    <alias name="Nom" field="name" index="38"/>
    <alias name="Ouvrage principal" field="fk_parent" index="39"/>
    <alias name="Télécom." field="fk_remote" index="40"/>
    <alias name="Type d'eau" field="fk_watertype" index="41"/>
    <alias name="Parcelle" field="parcel" index="42"/>
    <alias name="ECA" field="eca" index="43"/>
    <alias name="Eau de surface" field="open_water_surface" index="44"/>
    <alias name="" field="geometry_polygon" index="45"/>
    <alias name="séparation de réseau" field="networkseparation" index="46"/>
    <alias name="débitmètre" field="flow_meter" index="47"/>
    <alias name="compteur" field="water_meter" index="48"/>
    <alias name="manomètre" field="manometer" index="49"/>
    <alias name="profondeur" field="depth" index="50"/>
    <alias name="" field="no_valves" index="51"/>
    <alias name="type" field="fk_pressurecontrol_type" index="52"/>
    <alias name="type" field="fk_pump_type" index="53"/>
    <alias name="conduite entrée" field="fk_pipe_in" index="54"/>
    <alias name="conduite sortie" field="fk_pipe_out" index="55"/>
    <alias name="mode" field="fk_pump_operating" index="56"/>
    <alias name="nb. pompes" field="no_pumps" index="57"/>
    <alias name="débit refoulé" field="rejected_flow" index="58"/>
    <alias name="hauteur mano." field="manometric_height" index="59"/>
    <alias name="type" field="fk_source_type" index="60"/>
    <alias name="qualité" field="fk_source_quality" index="61"/>
    <alias name="débit étiage" field="flow_lowest" index="62"/>
    <alias name="débit moyen" field="flow_average" index="63"/>
    <alias name="débit concession" field="flow_concession" index="64"/>
    <alias name="fin contrat" field="contract_end" index="65"/>
    <alias name="chambre de rassemblement" field="gathering_chamber" index="66"/>
    <alias name="Trop-plein" field="fk_overflow" index="67"/>
    <alias name="Type rés. incendie" field="fk_tank_firestorage" index="68"/>
    <alias name="Réserve totale" field="storage_total" index="69"/>
    <alias name="Rés. utile" field="storage_supply" index="70"/>
    <alias name="Rés. incendie" field="storage_fire" index="71"/>
    <alias name="Alt. trop-plein" field="altitude_overflow" index="72"/>
    <alias name="Alt. radier" field="altitude_apron" index="73"/>
    <alias name="Hauteur max." field="height_max" index="74"/>
    <alias name="Vanne incendie" field="fire_valve" index="75"/>
    <alias name="Télécommande incendie" field="fire_remote" index="76"/>
    <alias name="Litres/cm" field="_litrepercm" index="77"/>
    <alias name="Type" field="cistern1_fk_type" index="78"/>
    <alias name="Diamètre/largeur" field="cistern1_dimension_1" index="79"/>
    <alias name="Longueur" field="cistern1_dimension_2" index="80"/>
    <alias name="Volume" field="cistern1_storage" index="81"/>
    <alias name="Litres/cm" field="_cistern1_litrepercm" index="82"/>
    <alias name="Type" field="cistern2_fk_type" index="83"/>
    <alias name="Diamètre/largeur" field="cistern2_dimension_1" index="84"/>
    <alias name="Longueur" field="cistern2_dimension_2" index="85"/>
    <alias name="Volume" field="cistern2_storage" index="86"/>
    <alias name="Litres/cm" field="_cistern2_litrepercm" index="87"/>
    <alias name="désinfection UV" field="sanitization_uv" index="88"/>
    <alias name="désinfection chlore liquide" field="sanitization_chlorine_liquid" index="89"/>
    <alias name="désinfection chlore gazeaux" field="sanitization_chlorine_gas" index="90"/>
    <alias name="désinfection ozone" field="sanitization_ozone" index="91"/>
    <alias name="filtration membranaire" field="filtration_membrane" index="92"/>
    <alias name="filtration à sable" field="filtration_sandorgravel" index="93"/>
    <alias name="flocculation" field="flocculation" index="94"/>
    <alias name="charbon actif" field="activatedcharcoal" index="95"/>
    <alias name="décantation" field="settling" index="96"/>
    <alias name="capacité" field="treatment_capacity" index="97"/>
    <alias name="" field="status_active" index="98"/>
    <alias name="" field="status_functional" index="99"/>
    <alias name="" field="_installation_type_short" index="100"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" field="id" expression=""/>
    <default applyOnUpdate="0" field="fk_district" expression=""/>
    <default applyOnUpdate="0" field="fk_pressurezone" expression=""/>
    <default applyOnUpdate="0" field="fk_printmap" expression=""/>
    <default applyOnUpdate="0" field="_printmaps" expression=""/>
    <default applyOnUpdate="0" field="_geometry_alt1_used" expression=""/>
    <default applyOnUpdate="0" field="_geometry_alt2_used" expression=""/>
    <default applyOnUpdate="0" field="_pipe_node_type" expression=""/>
    <default applyOnUpdate="0" field="_pipe_orientation" expression=""/>
    <default applyOnUpdate="0" field="_pipe_schema_visible" expression=""/>
    <default applyOnUpdate="0" field="geometry_alt1" expression=""/>
    <default applyOnUpdate="0" field="geometry_alt2" expression=""/>
    <default applyOnUpdate="0" field="update_geometry_alt1" expression=""/>
    <default applyOnUpdate="0" field="update_geometry_alt2" expression=""/>
    <default applyOnUpdate="0" field="identification" expression=""/>
    <default applyOnUpdate="0" field="fk_distributor" expression=""/>
    <default applyOnUpdate="0" field="fk_status" expression=""/>
    <default applyOnUpdate="0" field="fk_folder" expression=""/>
    <default applyOnUpdate="0" field="fk_locationtype" expression=""/>
    <default applyOnUpdate="0" field="fk_precision" expression=""/>
    <default applyOnUpdate="0" field="fk_precisionalti" expression=""/>
    <default applyOnUpdate="0" field="fk_object_reference" expression=""/>
    <default applyOnUpdate="0" field="altitude" expression=""/>
    <default applyOnUpdate="0" field="year" expression=""/>
    <default applyOnUpdate="0" field="year_end" expression=""/>
    <default applyOnUpdate="0" field="orientation" expression=""/>
    <default applyOnUpdate="0" field="remark" expression=""/>
    <default applyOnUpdate="0" field="label_1_visible" expression=""/>
    <default applyOnUpdate="0" field="label_1_x" expression=""/>
    <default applyOnUpdate="0" field="label_1_y" expression=""/>
    <default applyOnUpdate="0" field="label_1_rotation" expression=""/>
    <default applyOnUpdate="0" field="label_1_text" expression=""/>
    <default applyOnUpdate="0" field="label_2_visible" expression=""/>
    <default applyOnUpdate="0" field="label_2_x" expression=""/>
    <default applyOnUpdate="0" field="label_2_y" expression=""/>
    <default applyOnUpdate="0" field="label_2_rotation" expression=""/>
    <default applyOnUpdate="0" field="label_2_text" expression=""/>
    <default applyOnUpdate="0" field="installation_type" expression=""/>
    <default applyOnUpdate="0" field="name" expression=""/>
    <default applyOnUpdate="0" field="fk_parent" expression=""/>
    <default applyOnUpdate="0" field="fk_remote" expression=""/>
    <default applyOnUpdate="0" field="fk_watertype" expression=""/>
    <default applyOnUpdate="0" field="parcel" expression=""/>
    <default applyOnUpdate="0" field="eca" expression=""/>
    <default applyOnUpdate="0" field="open_water_surface" expression=""/>
    <default applyOnUpdate="0" field="geometry_polygon" expression=""/>
    <default applyOnUpdate="0" field="networkseparation" expression=""/>
    <default applyOnUpdate="0" field="flow_meter" expression=""/>
    <default applyOnUpdate="0" field="water_meter" expression=""/>
    <default applyOnUpdate="0" field="manometer" expression=""/>
    <default applyOnUpdate="0" field="depth" expression=""/>
    <default applyOnUpdate="0" field="no_valves" expression=""/>
    <default applyOnUpdate="0" field="fk_pressurecontrol_type" expression=""/>
    <default applyOnUpdate="0" field="fk_pump_type" expression=""/>
    <default applyOnUpdate="0" field="fk_pipe_in" expression=""/>
    <default applyOnUpdate="0" field="fk_pipe_out" expression=""/>
    <default applyOnUpdate="0" field="fk_pump_operating" expression=""/>
    <default applyOnUpdate="0" field="no_pumps" expression=""/>
    <default applyOnUpdate="0" field="rejected_flow" expression=""/>
    <default applyOnUpdate="0" field="manometric_height" expression=""/>
    <default applyOnUpdate="0" field="fk_source_type" expression=""/>
    <default applyOnUpdate="0" field="fk_source_quality" expression=""/>
    <default applyOnUpdate="0" field="flow_lowest" expression=""/>
    <default applyOnUpdate="0" field="flow_average" expression=""/>
    <default applyOnUpdate="0" field="flow_concession" expression=""/>
    <default applyOnUpdate="0" field="contract_end" expression=""/>
    <default applyOnUpdate="0" field="gathering_chamber" expression=""/>
    <default applyOnUpdate="0" field="fk_overflow" expression=""/>
    <default applyOnUpdate="0" field="fk_tank_firestorage" expression=""/>
    <default applyOnUpdate="0" field="storage_total" expression=""/>
    <default applyOnUpdate="0" field="storage_supply" expression=""/>
    <default applyOnUpdate="0" field="storage_fire" expression=""/>
    <default applyOnUpdate="0" field="altitude_overflow" expression=""/>
    <default applyOnUpdate="0" field="altitude_apron" expression=""/>
    <default applyOnUpdate="0" field="height_max" expression=""/>
    <default applyOnUpdate="0" field="fire_valve" expression=""/>
    <default applyOnUpdate="0" field="fire_remote" expression=""/>
    <default applyOnUpdate="0" field="_litrepercm" expression=""/>
    <default applyOnUpdate="0" field="cistern1_fk_type" expression=""/>
    <default applyOnUpdate="0" field="cistern1_dimension_1" expression=""/>
    <default applyOnUpdate="0" field="cistern1_dimension_2" expression=""/>
    <default applyOnUpdate="0" field="cistern1_storage" expression=""/>
    <default applyOnUpdate="0" field="_cistern1_litrepercm" expression=""/>
    <default applyOnUpdate="0" field="cistern2_fk_type" expression=""/>
    <default applyOnUpdate="0" field="cistern2_dimension_1" expression=""/>
    <default applyOnUpdate="0" field="cistern2_dimension_2" expression=""/>
    <default applyOnUpdate="0" field="cistern2_storage" expression=""/>
    <default applyOnUpdate="0" field="_cistern2_litrepercm" expression=""/>
    <default applyOnUpdate="0" field="sanitization_uv" expression=""/>
    <default applyOnUpdate="0" field="sanitization_chlorine_liquid" expression=""/>
    <default applyOnUpdate="0" field="sanitization_chlorine_gas" expression=""/>
    <default applyOnUpdate="0" field="sanitization_ozone" expression=""/>
    <default applyOnUpdate="0" field="filtration_membrane" expression=""/>
    <default applyOnUpdate="0" field="filtration_sandorgravel" expression=""/>
    <default applyOnUpdate="0" field="flocculation" expression=""/>
    <default applyOnUpdate="0" field="activatedcharcoal" expression=""/>
    <default applyOnUpdate="0" field="settling" expression=""/>
    <default applyOnUpdate="0" field="treatment_capacity" expression=""/>
    <default applyOnUpdate="0" field="status_active" expression=""/>
    <default applyOnUpdate="0" field="status_functional" expression=""/>
    <default applyOnUpdate="0" field="_installation_type_short" expression=""/>
  </defaults>
  <constraints>
    <constraint field="id" constraints="3" exp_strength="0" notnull_strength="1" unique_strength="1"/>
    <constraint field="fk_district" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_pressurezone" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_printmap" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="_printmaps" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="_geometry_alt1_used" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="_geometry_alt2_used" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="_pipe_node_type" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="_pipe_orientation" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="_pipe_schema_visible" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="geometry_alt1" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="geometry_alt2" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="update_geometry_alt1" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="update_geometry_alt2" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="identification" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_distributor" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_status" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_folder" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_locationtype" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_precision" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_precisionalti" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_object_reference" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="altitude" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="year" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="year_end" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="orientation" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="remark" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="label_1_visible" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="label_1_x" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="label_1_y" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="label_1_rotation" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="label_1_text" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="label_2_visible" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="label_2_x" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="label_2_y" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="label_2_rotation" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="label_2_text" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="installation_type" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="name" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_parent" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_remote" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_watertype" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="parcel" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="eca" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="open_water_surface" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="geometry_polygon" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="networkseparation" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="flow_meter" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="water_meter" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="manometer" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="depth" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="no_valves" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_pressurecontrol_type" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_pump_type" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_pipe_in" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_pipe_out" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_pump_operating" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="no_pumps" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="rejected_flow" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="manometric_height" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_source_type" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_source_quality" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="flow_lowest" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="flow_average" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="flow_concession" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="contract_end" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="gathering_chamber" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_overflow" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fk_tank_firestorage" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="storage_total" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="storage_supply" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="storage_fire" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="altitude_overflow" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="altitude_apron" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="height_max" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fire_valve" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="fire_remote" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="_litrepercm" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cistern1_fk_type" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cistern1_dimension_1" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cistern1_dimension_2" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cistern1_storage" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="_cistern1_litrepercm" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cistern2_fk_type" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cistern2_dimension_1" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cistern2_dimension_2" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="cistern2_storage" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="_cistern2_litrepercm" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="sanitization_uv" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="sanitization_chlorine_liquid" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="sanitization_chlorine_gas" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="sanitization_ozone" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="filtration_membrane" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="filtration_sandorgravel" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="flocculation" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="activatedcharcoal" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="settling" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="treatment_capacity" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="status_active" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="status_functional" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="_installation_type_short" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
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
    <constraint field="installation_type" desc="" exp=""/>
    <constraint field="name" desc="" exp=""/>
    <constraint field="fk_parent" desc="" exp=""/>
    <constraint field="fk_remote" desc="" exp=""/>
    <constraint field="fk_watertype" desc="" exp=""/>
    <constraint field="parcel" desc="" exp=""/>
    <constraint field="eca" desc="" exp=""/>
    <constraint field="open_water_surface" desc="" exp=""/>
    <constraint field="geometry_polygon" desc="" exp=""/>
    <constraint field="networkseparation" desc="" exp=""/>
    <constraint field="flow_meter" desc="" exp=""/>
    <constraint field="water_meter" desc="" exp=""/>
    <constraint field="manometer" desc="" exp=""/>
    <constraint field="depth" desc="" exp=""/>
    <constraint field="no_valves" desc="" exp=""/>
    <constraint field="fk_pressurecontrol_type" desc="" exp=""/>
    <constraint field="fk_pump_type" desc="" exp=""/>
    <constraint field="fk_pipe_in" desc="" exp=""/>
    <constraint field="fk_pipe_out" desc="" exp=""/>
    <constraint field="fk_pump_operating" desc="" exp=""/>
    <constraint field="no_pumps" desc="" exp=""/>
    <constraint field="rejected_flow" desc="" exp=""/>
    <constraint field="manometric_height" desc="" exp=""/>
    <constraint field="fk_source_type" desc="" exp=""/>
    <constraint field="fk_source_quality" desc="" exp=""/>
    <constraint field="flow_lowest" desc="" exp=""/>
    <constraint field="flow_average" desc="" exp=""/>
    <constraint field="flow_concession" desc="" exp=""/>
    <constraint field="contract_end" desc="" exp=""/>
    <constraint field="gathering_chamber" desc="" exp=""/>
    <constraint field="fk_overflow" desc="" exp=""/>
    <constraint field="fk_tank_firestorage" desc="" exp=""/>
    <constraint field="storage_total" desc="" exp=""/>
    <constraint field="storage_supply" desc="" exp=""/>
    <constraint field="storage_fire" desc="" exp=""/>
    <constraint field="altitude_overflow" desc="" exp=""/>
    <constraint field="altitude_apron" desc="" exp=""/>
    <constraint field="height_max" desc="" exp=""/>
    <constraint field="fire_valve" desc="" exp=""/>
    <constraint field="fire_remote" desc="" exp=""/>
    <constraint field="_litrepercm" desc="" exp=""/>
    <constraint field="cistern1_fk_type" desc="" exp=""/>
    <constraint field="cistern1_dimension_1" desc="" exp=""/>
    <constraint field="cistern1_dimension_2" desc="" exp=""/>
    <constraint field="cistern1_storage" desc="" exp=""/>
    <constraint field="_cistern1_litrepercm" desc="" exp=""/>
    <constraint field="cistern2_fk_type" desc="" exp=""/>
    <constraint field="cistern2_dimension_1" desc="" exp=""/>
    <constraint field="cistern2_dimension_2" desc="" exp=""/>
    <constraint field="cistern2_storage" desc="" exp=""/>
    <constraint field="_cistern2_litrepercm" desc="" exp=""/>
    <constraint field="sanitization_uv" desc="" exp=""/>
    <constraint field="sanitization_chlorine_liquid" desc="" exp=""/>
    <constraint field="sanitization_chlorine_gas" desc="" exp=""/>
    <constraint field="sanitization_ozone" desc="" exp=""/>
    <constraint field="filtration_membrane" desc="" exp=""/>
    <constraint field="filtration_sandorgravel" desc="" exp=""/>
    <constraint field="flocculation" desc="" exp=""/>
    <constraint field="activatedcharcoal" desc="" exp=""/>
    <constraint field="settling" desc="" exp=""/>
    <constraint field="treatment_capacity" desc="" exp=""/>
    <constraint field="status_active" desc="" exp=""/>
    <constraint field="status_functional" desc="" exp=""/>
    <constraint field="_installation_type_short" desc="" exp=""/>
  </constraintExpressions>
  <expressionfields>
    <field name="_installation_type_short" precision="0" typeName="int2" type="2" expression="CASE WHEN  &quot;installation_type&quot; = 'chamber' THEN 'C.'&#xa; WHEN  &quot;installation_type&quot; =  'pressurecontrol'  AND  &quot;fk_pressurecontrol_type&quot; = 2801 THEN 'CR.'&#xa; WHEN  &quot;installation_type&quot; =  'pressurecontrol'  AND  &quot;fk_pressurecontrol_type&quot; = 2802 THEN 'CCP.'&#xa; WHEN  &quot;installation_type&quot; =  'pressurecontrol'  AND  &quot;fk_pressurecontrol_type&quot; = 2803 THEN 'CRA.'&#xa; WHEN  &quot;installation_type&quot; =  'pump'  THEN 'P.'&#xa; WHEN  &quot;installation_type&quot; =  'source'  THEN 'S.'&#xa; WHEN  &quot;installation_type&quot; =  'tank'  THEN 'R.'&#xa; WHEN  &quot;installation_type&quot; =  'treatment'  THEN 'T.'&#xa;ELSE ''&#xa;END" length="-1" comment="" subType="0"/>
  </expressionfields>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column name="id" hidden="0" type="field" width="-1"/>
      <column name="fk_district" hidden="0" type="field" width="-1"/>
      <column name="fk_pressurezone" hidden="0" type="field" width="-1"/>
      <column name="fk_printmap" hidden="0" type="field" width="-1"/>
      <column name="_printmaps" hidden="0" type="field" width="-1"/>
      <column name="_geometry_alt1_used" hidden="0" type="field" width="-1"/>
      <column name="_geometry_alt2_used" hidden="0" type="field" width="-1"/>
      <column name="_pipe_node_type" hidden="0" type="field" width="-1"/>
      <column name="_pipe_orientation" hidden="0" type="field" width="-1"/>
      <column name="_pipe_schema_visible" hidden="0" type="field" width="-1"/>
      <column name="geometry_alt1" hidden="0" type="field" width="-1"/>
      <column name="geometry_alt2" hidden="0" type="field" width="-1"/>
      <column name="update_geometry_alt1" hidden="0" type="field" width="-1"/>
      <column name="update_geometry_alt2" hidden="0" type="field" width="-1"/>
      <column name="identification" hidden="0" type="field" width="-1"/>
      <column name="fk_distributor" hidden="0" type="field" width="-1"/>
      <column name="fk_status" hidden="0" type="field" width="-1"/>
      <column name="fk_folder" hidden="0" type="field" width="-1"/>
      <column name="fk_locationtype" hidden="0" type="field" width="-1"/>
      <column name="year" hidden="0" type="field" width="-1"/>
      <column name="year_end" hidden="0" type="field" width="-1"/>
      <column name="remark" hidden="0" type="field" width="-1"/>
      <column name="label_1_visible" hidden="0" type="field" width="-1"/>
      <column name="label_1_x" hidden="0" type="field" width="-1"/>
      <column name="label_1_y" hidden="0" type="field" width="-1"/>
      <column name="label_1_rotation" hidden="0" type="field" width="-1"/>
      <column name="label_1_text" hidden="0" type="field" width="-1"/>
      <column name="label_2_visible" hidden="0" type="field" width="-1"/>
      <column name="label_2_x" hidden="0" type="field" width="-1"/>
      <column name="label_2_y" hidden="0" type="field" width="-1"/>
      <column name="label_2_rotation" hidden="0" type="field" width="-1"/>
      <column name="label_2_text" hidden="0" type="field" width="-1"/>
      <column name="fk_precision" hidden="0" type="field" width="-1"/>
      <column name="fk_precisionalti" hidden="0" type="field" width="-1"/>
      <column name="fk_object_reference" hidden="0" type="field" width="-1"/>
      <column name="altitude" hidden="0" type="field" width="-1"/>
      <column name="orientation" hidden="0" type="field" width="-1"/>
      <column name="installation_type" hidden="0" type="field" width="-1"/>
      <column name="name" hidden="0" type="field" width="-1"/>
      <column name="fk_parent" hidden="0" type="field" width="-1"/>
      <column name="fk_remote" hidden="0" type="field" width="-1"/>
      <column name="fk_watertype" hidden="0" type="field" width="-1"/>
      <column name="parcel" hidden="0" type="field" width="-1"/>
      <column name="eca" hidden="0" type="field" width="-1"/>
      <column name="open_water_surface" hidden="0" type="field" width="-1"/>
      <column name="geometry_polygon" hidden="0" type="field" width="-1"/>
      <column name="fk_source_type" hidden="0" type="field" width="-1"/>
      <column name="fk_source_quality" hidden="0" type="field" width="-1"/>
      <column name="flow_lowest" hidden="0" type="field" width="-1"/>
      <column name="flow_average" hidden="0" type="field" width="-1"/>
      <column name="flow_concession" hidden="0" type="field" width="-1"/>
      <column name="contract_end" hidden="0" type="field" width="-1"/>
      <column name="gathering_chamber" hidden="0" type="field" width="-1"/>
      <column name="fk_pump_type" hidden="0" type="field" width="-1"/>
      <column name="fk_pipe_in" hidden="0" type="field" width="-1"/>
      <column name="fk_pipe_out" hidden="0" type="field" width="-1"/>
      <column name="fk_pump_operating" hidden="0" type="field" width="-1"/>
      <column name="no_pumps" hidden="0" type="field" width="-1"/>
      <column name="rejected_flow" hidden="0" type="field" width="-1"/>
      <column name="manometric_height" hidden="0" type="field" width="-1"/>
      <column name="fk_overflow" hidden="0" type="field" width="-1"/>
      <column name="fk_tank_firestorage" hidden="0" type="field" width="-1"/>
      <column name="storage_total" hidden="0" type="field" width="-1"/>
      <column name="storage_supply" hidden="0" type="field" width="-1"/>
      <column name="storage_fire" hidden="0" type="field" width="-1"/>
      <column name="altitude_overflow" hidden="0" type="field" width="-1"/>
      <column name="altitude_apron" hidden="0" type="field" width="-1"/>
      <column name="height_max" hidden="0" type="field" width="-1"/>
      <column name="fire_valve" hidden="0" type="field" width="-1"/>
      <column name="fire_remote" hidden="0" type="field" width="-1"/>
      <column name="_litrepercm" hidden="0" type="field" width="-1"/>
      <column name="cistern1_fk_type" hidden="0" type="field" width="-1"/>
      <column name="cistern1_dimension_1" hidden="0" type="field" width="-1"/>
      <column name="cistern1_dimension_2" hidden="0" type="field" width="-1"/>
      <column name="cistern1_storage" hidden="0" type="field" width="-1"/>
      <column name="_cistern1_litrepercm" hidden="0" type="field" width="-1"/>
      <column name="cistern2_fk_type" hidden="0" type="field" width="-1"/>
      <column name="cistern2_dimension_1" hidden="0" type="field" width="-1"/>
      <column name="cistern2_dimension_2" hidden="0" type="field" width="-1"/>
      <column name="cistern2_storage" hidden="0" type="field" width="-1"/>
      <column name="_cistern2_litrepercm" hidden="0" type="field" width="-1"/>
      <column name="sanitization_uv" hidden="0" type="field" width="-1"/>
      <column name="sanitization_chlorine_liquid" hidden="0" type="field" width="-1"/>
      <column name="sanitization_ozone" hidden="0" type="field" width="-1"/>
      <column name="filtration_membrane" hidden="0" type="field" width="-1"/>
      <column name="filtration_sandorgravel" hidden="0" type="field" width="-1"/>
      <column name="flocculation" hidden="0" type="field" width="-1"/>
      <column name="activatedcharcoal" hidden="0" type="field" width="-1"/>
      <column name="settling" hidden="0" type="field" width="-1"/>
      <column name="treatment_capacity" hidden="0" type="field" width="-1"/>
      <column name="networkseparation" hidden="0" type="field" width="-1"/>
      <column name="flow_meter" hidden="0" type="field" width="-1"/>
      <column name="water_meter" hidden="0" type="field" width="-1"/>
      <column name="manometer" hidden="0" type="field" width="-1"/>
      <column name="depth" hidden="0" type="field" width="-1"/>
      <column name="no_valves" hidden="0" type="field" width="-1"/>
      <column name="fk_pressurecontrol_type" hidden="0" type="field" width="-1"/>
      <column name="status_active" hidden="0" type="field" width="-1"/>
      <column name="status_functional" hidden="0" type="field" width="-1"/>
      <column name="_installation_type_short" hidden="0" type="field" width="-1"/>
      <column hidden="1" type="actions" width="-1"/>
      <column name="sanitization_chlorine_gas" hidden="0" type="field" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">/home/lbartoletti/QWAT/qgis-project/ui_forms/installation.ui</editform>
  <editforminit>formOpen</editforminit>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>/home/lbartoletti/QWAT/qgis-project/python/installation_form.py</editforminitfilepath>
  <editforminitcode><![CDATA[from python.installation_form import formOpen
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer name="Général" groupBox="0" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="2">
      <attributeEditorContainer name="" groupBox="1" showLabel="0" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1">
        <attributeEditorField name="id" showLabel="1" index="0"/>
        <attributeEditorField name="installation_type" showLabel="1" index="37"/>
        <attributeEditorField name="name" showLabel="1" index="38"/>
        <attributeEditorField name="identification" showLabel="1" index="14"/>
        <attributeEditorField name="fk_parent" showLabel="1" index="39"/>
        <attributeEditorField name="eca" showLabel="1" index="43"/>
        <attributeEditorField name="fk_status" showLabel="1" index="16"/>
        <attributeEditorField name="parcel" showLabel="1" index="42"/>
        <attributeEditorField name="fk_distributor" showLabel="1" index="15"/>
        <attributeEditorField name="altitude" showLabel="1" index="22"/>
        <attributeEditorField name="year" showLabel="1" index="23"/>
        <attributeEditorField name="fk_precision" showLabel="1" index="19"/>
        <attributeEditorField name="year_end" showLabel="1" index="24"/>
        <attributeEditorField name="fk_precisionalti" showLabel="1" index="20"/>
        <attributeEditorField name="fk_watertype" showLabel="1" index="41"/>
        <attributeEditorField name="fk_object_reference" showLabel="1" index="21"/>
        <attributeEditorField name="fk_remote" showLabel="1" index="40"/>
        <attributeEditorField name="open_water_surface" showLabel="1" index="44"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Chambre" groupBox="1" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1">
        <attributeEditorField name="networkseparation" showLabel="1" index="46"/>
        <attributeEditorField name="flow_meter" showLabel="1" index="47"/>
        <attributeEditorField name="water_meter" showLabel="1" index="48"/>
        <attributeEditorField name="manometer" showLabel="1" index="49"/>
        <attributeEditorField name="depth" showLabel="1" index="50"/>
        <attributeEditorField name="no_valves" showLabel="1" index="51"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Régulation de pression" groupBox="1" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1">
        <attributeEditorField name="fk_pressurecontrol_type" showLabel="1" index="52"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Pompage" groupBox="1" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1">
        <attributeEditorField name="fk_pump_type" showLabel="1" index="53"/>
        <attributeEditorField name="fk_pump_operating" showLabel="1" index="56"/>
        <attributeEditorField name="no_pumps" showLabel="1" index="57"/>
        <attributeEditorField name="rejected_flow" showLabel="1" index="58"/>
        <attributeEditorField name="manometric_height" showLabel="1" index="59"/>
        <attributeEditorField name="fk_pipe_in" showLabel="1" index="54"/>
        <attributeEditorField name="fk_pipe_out" showLabel="1" index="55"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Source" groupBox="1" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1">
        <attributeEditorField name="fk_source_type" showLabel="1" index="60"/>
        <attributeEditorField name="fk_source_quality" showLabel="1" index="61"/>
        <attributeEditorField name="flow_lowest" showLabel="1" index="62"/>
        <attributeEditorField name="flow_average" showLabel="1" index="63"/>
        <attributeEditorField name="flow_concession" showLabel="1" index="64"/>
        <attributeEditorField name="contract_end" showLabel="1" index="65"/>
        <attributeEditorField name="gathering_chamber" showLabel="1" index="66"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Traitement" groupBox="1" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="2">
        <attributeEditorField name="sanitization_uv" showLabel="1" index="88"/>
        <attributeEditorField name="filtration_membrane" showLabel="1" index="92"/>
        <attributeEditorField name="sanitization_chlorine_liquid" showLabel="1" index="89"/>
        <attributeEditorField name="filtration_sandorgravel" showLabel="1" index="93"/>
        <attributeEditorField name="sanitization_chlorine_gas" showLabel="1" index="90"/>
        <attributeEditorField name="flocculation" showLabel="1" index="94"/>
        <attributeEditorField name="sanitization_ozone" showLabel="1" index="91"/>
        <attributeEditorField name="activatedcharcoal" showLabel="1" index="95"/>
        <attributeEditorField name="settling" showLabel="1" index="96"/>
        <attributeEditorField name="treatment_capacity" showLabel="1" index="97"/>
      </attributeEditorContainer>
      <attributeEditorField name="remark" showLabel="0" index="26"/>
    </attributeEditorContainer>
    <attributeEditorContainer name="Emplacement" groupBox="0" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1">
      <attributeEditorField name="fk_locationtype" showLabel="1" index="18"/>
    </attributeEditorContainer>
    <attributeEditorContainer name="Réservoir" groupBox="0" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="2">
      <attributeEditorField name="storage_total" showLabel="1" index="69"/>
      <attributeEditorField name="storage_supply" showLabel="1" index="70"/>
      <attributeEditorField name="_litrepercm" showLabel="1" index="77"/>
      <attributeEditorField name="storage_fire" showLabel="1" index="71"/>
      <attributeEditorField name="fk_overflow" showLabel="1" index="67"/>
      <attributeEditorField name="fk_tank_firestorage" showLabel="1" index="68"/>
      <attributeEditorField name="altitude_overflow" showLabel="1" index="72"/>
      <attributeEditorField name="fire_valve" showLabel="1" index="75"/>
      <attributeEditorField name="altitude_apron" showLabel="1" index="73"/>
      <attributeEditorField name="fire_remote" showLabel="1" index="76"/>
      <attributeEditorField name="height_max" showLabel="1" index="74"/>
      <attributeEditorContainer name="Cuves" groupBox="1" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1">
        <attributeEditorContainer name="Cuve 1" groupBox="1" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1">
          <attributeEditorField name="cistern1_fk_type" showLabel="1" index="78"/>
          <attributeEditorField name="cistern1_dimension_1" showLabel="1" index="79"/>
          <attributeEditorField name="cistern1_dimension_2" showLabel="1" index="80"/>
          <attributeEditorField name="cistern1_storage" showLabel="1" index="81"/>
          <attributeEditorField name="_cistern1_litrepercm" showLabel="1" index="82"/>
        </attributeEditorContainer>
        <attributeEditorContainer name="Cuve 2" groupBox="1" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1">
          <attributeEditorField name="cistern2_fk_type" showLabel="1" index="83"/>
          <attributeEditorField name="cistern2_dimension_1" showLabel="1" index="84"/>
          <attributeEditorField name="cistern2_dimension_2" showLabel="1" index="85"/>
          <attributeEditorField name="cistern2_storage" showLabel="1" index="86"/>
          <attributeEditorField name="_cistern2_litrepercm" showLabel="1" index="87"/>
        </attributeEditorContainer>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="_cistern1_litrepercm" editable="1"/>
    <field name="_cistern2_litrepercm" editable="1"/>
    <field name="_geometry_alt1_used" editable="1"/>
    <field name="_geometry_alt2_used" editable="1"/>
    <field name="_installation_type_short" editable="0"/>
    <field name="_litrepercm" editable="1"/>
    <field name="_pipe_node_type" editable="1"/>
    <field name="_pipe_orientation" editable="1"/>
    <field name="_pipe_schema_visible" editable="1"/>
    <field name="_printmaps" editable="1"/>
    <field name="activatedcharcoal" editable="1"/>
    <field name="altitude" editable="1"/>
    <field name="altitude_apron" editable="1"/>
    <field name="altitude_overflow" editable="1"/>
    <field name="cistern1_dimension_1" editable="1"/>
    <field name="cistern1_dimension_2" editable="1"/>
    <field name="cistern1_fk_type" editable="1"/>
    <field name="cistern1_storage" editable="1"/>
    <field name="cistern2_dimension_1" editable="1"/>
    <field name="cistern2_dimension_2" editable="1"/>
    <field name="cistern2_fk_type" editable="1"/>
    <field name="cistern2_storage" editable="1"/>
    <field name="contract_end" editable="1"/>
    <field name="depth" editable="1"/>
    <field name="eca" editable="1"/>
    <field name="filtration_membrane" editable="1"/>
    <field name="filtration_sandorgravel" editable="1"/>
    <field name="fire_remote" editable="1"/>
    <field name="fire_valve" editable="1"/>
    <field name="fk_distributor" editable="1"/>
    <field name="fk_district" editable="1"/>
    <field name="fk_folder" editable="1"/>
    <field name="fk_locationtype" editable="1"/>
    <field name="fk_object_reference" editable="1"/>
    <field name="fk_overflow" editable="1"/>
    <field name="fk_parent" editable="1"/>
    <field name="fk_pipe_in" editable="1"/>
    <field name="fk_pipe_out" editable="1"/>
    <field name="fk_precision" editable="1"/>
    <field name="fk_precisionalti" editable="1"/>
    <field name="fk_pressurecontrol_type" editable="1"/>
    <field name="fk_pressurezone" editable="1"/>
    <field name="fk_printmap" editable="1"/>
    <field name="fk_pump_operating" editable="1"/>
    <field name="fk_pump_type" editable="1"/>
    <field name="fk_remote" editable="1"/>
    <field name="fk_source_quality" editable="1"/>
    <field name="fk_source_type" editable="1"/>
    <field name="fk_status" editable="1"/>
    <field name="fk_tank_firestorage" editable="1"/>
    <field name="fk_watertype" editable="1"/>
    <field name="flocculation" editable="1"/>
    <field name="flow_average" editable="1"/>
    <field name="flow_concession" editable="1"/>
    <field name="flow_lowest" editable="1"/>
    <field name="flow_meter" editable="1"/>
    <field name="gathering_chamber" editable="1"/>
    <field name="geometry_alt1" editable="1"/>
    <field name="geometry_alt2" editable="1"/>
    <field name="geometry_polygon" editable="1"/>
    <field name="height_max" editable="1"/>
    <field name="id" editable="1"/>
    <field name="identification" editable="1"/>
    <field name="installation_type" editable="1"/>
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
    <field name="manometer" editable="1"/>
    <field name="manometric_height" editable="1"/>
    <field name="name" editable="1"/>
    <field name="networkseparation" editable="1"/>
    <field name="no_pumps" editable="1"/>
    <field name="no_valves" editable="1"/>
    <field name="open_water_surface" editable="1"/>
    <field name="orientation" editable="1"/>
    <field name="parcel" editable="1"/>
    <field name="rejected_flow" editable="1"/>
    <field name="remark" editable="1"/>
    <field name="sanitization_chlorine_gas" editable="1"/>
    <field name="sanitization_chlorine_liquid" editable="1"/>
    <field name="sanitization_ozone" editable="1"/>
    <field name="sanitization_uv" editable="1"/>
    <field name="settling" editable="1"/>
    <field name="status_active" editable="0"/>
    <field name="status_functional" editable="0"/>
    <field name="storage_fire" editable="1"/>
    <field name="storage_supply" editable="1"/>
    <field name="storage_total" editable="1"/>
    <field name="treatment_capacity" editable="1"/>
    <field name="update_geometry_alt1" editable="1"/>
    <field name="update_geometry_alt2" editable="1"/>
    <field name="water_meter" editable="1"/>
    <field name="year" editable="1"/>
    <field name="year_end" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="_cistern1_litrepercm" labelOnTop="0"/>
    <field name="_cistern2_litrepercm" labelOnTop="0"/>
    <field name="_geometry_alt1_used" labelOnTop="0"/>
    <field name="_geometry_alt2_used" labelOnTop="0"/>
    <field name="_installation_type_short" labelOnTop="0"/>
    <field name="_litrepercm" labelOnTop="0"/>
    <field name="_pipe_node_type" labelOnTop="0"/>
    <field name="_pipe_orientation" labelOnTop="0"/>
    <field name="_pipe_schema_visible" labelOnTop="0"/>
    <field name="_printmaps" labelOnTop="0"/>
    <field name="activatedcharcoal" labelOnTop="0"/>
    <field name="altitude" labelOnTop="0"/>
    <field name="altitude_apron" labelOnTop="0"/>
    <field name="altitude_overflow" labelOnTop="0"/>
    <field name="cistern1_dimension_1" labelOnTop="0"/>
    <field name="cistern1_dimension_2" labelOnTop="0"/>
    <field name="cistern1_fk_type" labelOnTop="0"/>
    <field name="cistern1_storage" labelOnTop="0"/>
    <field name="cistern2_dimension_1" labelOnTop="0"/>
    <field name="cistern2_dimension_2" labelOnTop="0"/>
    <field name="cistern2_fk_type" labelOnTop="0"/>
    <field name="cistern2_storage" labelOnTop="0"/>
    <field name="contract_end" labelOnTop="0"/>
    <field name="depth" labelOnTop="0"/>
    <field name="eca" labelOnTop="0"/>
    <field name="filtration_membrane" labelOnTop="0"/>
    <field name="filtration_sandorgravel" labelOnTop="0"/>
    <field name="fire_remote" labelOnTop="0"/>
    <field name="fire_valve" labelOnTop="0"/>
    <field name="fk_distributor" labelOnTop="0"/>
    <field name="fk_district" labelOnTop="0"/>
    <field name="fk_folder" labelOnTop="0"/>
    <field name="fk_locationtype" labelOnTop="0"/>
    <field name="fk_object_reference" labelOnTop="0"/>
    <field name="fk_overflow" labelOnTop="0"/>
    <field name="fk_parent" labelOnTop="0"/>
    <field name="fk_pipe_in" labelOnTop="0"/>
    <field name="fk_pipe_out" labelOnTop="0"/>
    <field name="fk_precision" labelOnTop="0"/>
    <field name="fk_precisionalti" labelOnTop="0"/>
    <field name="fk_pressurecontrol_type" labelOnTop="0"/>
    <field name="fk_pressurezone" labelOnTop="0"/>
    <field name="fk_printmap" labelOnTop="0"/>
    <field name="fk_pump_operating" labelOnTop="0"/>
    <field name="fk_pump_type" labelOnTop="0"/>
    <field name="fk_remote" labelOnTop="0"/>
    <field name="fk_source_quality" labelOnTop="0"/>
    <field name="fk_source_type" labelOnTop="0"/>
    <field name="fk_status" labelOnTop="0"/>
    <field name="fk_tank_firestorage" labelOnTop="0"/>
    <field name="fk_watertype" labelOnTop="0"/>
    <field name="flocculation" labelOnTop="0"/>
    <field name="flow_average" labelOnTop="0"/>
    <field name="flow_concession" labelOnTop="0"/>
    <field name="flow_lowest" labelOnTop="0"/>
    <field name="flow_meter" labelOnTop="0"/>
    <field name="gathering_chamber" labelOnTop="0"/>
    <field name="geometry_alt1" labelOnTop="0"/>
    <field name="geometry_alt2" labelOnTop="0"/>
    <field name="geometry_polygon" labelOnTop="0"/>
    <field name="height_max" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="identification" labelOnTop="0"/>
    <field name="installation_type" labelOnTop="0"/>
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
    <field name="manometer" labelOnTop="0"/>
    <field name="manometric_height" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="networkseparation" labelOnTop="0"/>
    <field name="no_pumps" labelOnTop="0"/>
    <field name="no_valves" labelOnTop="0"/>
    <field name="open_water_surface" labelOnTop="0"/>
    <field name="orientation" labelOnTop="0"/>
    <field name="parcel" labelOnTop="0"/>
    <field name="rejected_flow" labelOnTop="0"/>
    <field name="remark" labelOnTop="0"/>
    <field name="sanitization_chlorine_gas" labelOnTop="0"/>
    <field name="sanitization_chlorine_liquid" labelOnTop="0"/>
    <field name="sanitization_ozone" labelOnTop="0"/>
    <field name="sanitization_uv" labelOnTop="0"/>
    <field name="settling" labelOnTop="0"/>
    <field name="status_active" labelOnTop="0"/>
    <field name="status_functional" labelOnTop="0"/>
    <field name="storage_fire" labelOnTop="0"/>
    <field name="storage_supply" labelOnTop="0"/>
    <field name="storage_total" labelOnTop="0"/>
    <field name="treatment_capacity" labelOnTop="0"/>
    <field name="update_geometry_alt1" labelOnTop="0"/>
    <field name="update_geometry_alt2" labelOnTop="0"/>
    <field name="water_meter" labelOnTop="0"/>
    <field name="year" labelOnTop="0"/>
    <field name="year_end" labelOnTop="0"/>
  </labelOnTop>
  <widgets>
    <widget name="relation_cover_installation">
      <config type="Map">
        <Option name="nm-rel" value="" type="QString"/>
      </config>
    </widget>
    <widget name="relation_installation_parent">
      <config type="Map">
        <Option name="nm-rel" value="" type="QString"/>
      </config>
    </widget>
  </widgets>
  <previewExpression>coalesce(identification|| ' ','') || CASE
WHEN  "installation_type"  = 'chamber' THEN 'C. '
WHEN "installation_type"  = 'pressurecontrol' AND fk_pressurecontrol_type = 2801 THEN 'CR. '
WHEN  "installation_type"  = 'pressurecontrol' AND fk_pressurecontrol_type = 2802 THEN 'CCP. '
WHEN  "installation_type"  = 'pressurecontrol' AND fk_pressurecontrol_type = 2803 THEN 'CRA. '
WHEN  "installation_type"  = 'pump' THEN 'P. '
WHEN  "installation_type"  = 'source' THEN 'S. '
WHEN  "installation_type"  = 'tank' THEN 'R. '
WHEN  "installation_type"  = 'treatment' THEN 'T. '
ELSE ''
END
|| coalesce(name,'')</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
