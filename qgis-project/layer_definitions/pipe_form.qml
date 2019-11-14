<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.5.0-Master" styleCategories="Forms">
  <editform tolerant="1">/home/regis/OSLANDIA/projets_locaux/QWAT/QWAT/qgis-project/ui_forms/pipe.ui</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>/home/regis</editforminitfilepath>
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
    <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="0" name="Général" visibilityExpression="" columnCount="1" showLabel="1">
      <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="1" name="general_groupe_deux_colonnes" visibilityExpression="" columnCount="2" showLabel="0">
        <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="1" name="General_col2" visibilityExpression="" columnCount="1" showLabel="0">
          <attributeEditorField name="fk_function" index="2" showLabel="1"/>
          <attributeEditorField name="fk_status" index="9" showLabel="1"/>
          <attributeEditorField name="fk_material" index="4" showLabel="1"/>
          <attributeEditorField name="fk_installmethod" index="3" showLabel="1"/>
          <attributeEditorField name="fk_bedding" index="7" showLabel="1"/>
          <attributeEditorField name="fk_protection" index="8" showLabel="1"/>
        </attributeEditorContainer>
        <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="1" name="General_col1" visibilityExpression="" columnCount="1" showLabel="0">
          <attributeEditorField name="id" index="0" showLabel="1"/>
          <attributeEditorField name="fk_distributor" index="5" showLabel="1"/>
          <attributeEditorField name="fk_folder" index="12" showLabel="1"/>
          <attributeEditorField name="year" index="13" showLabel="1"/>
          <attributeEditorField name="year_rehabilitation" index="14" showLabel="1"/>
          <attributeEditorField name="year_end" index="15" showLabel="1"/>
          <attributeEditorField name="tunnel_or_bridge" index="16" showLabel="1"/>
        </attributeEditorContainer>
      </attributeEditorContainer>
      <attributeEditorField name="remark" index="18" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="0" name="Hydraulique" visibilityExpression="" columnCount="2" showLabel="1">
      <attributeEditorField name="fk_watertype" index="10" showLabel="1"/>
      <attributeEditorField name="pressure_nominal" index="17" showLabel="1"/>
      <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="1" name="Vannes" visibilityExpression="" columnCount="1" showLabel="1">
        <attributeEditorField name="_valve_count" index="19" showLabel="1"/>
        <attributeEditorField name="_valve_closed" index="20" showLabel="1"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="0" name="Géométrie" visibilityExpression="" columnCount="2" showLabel="1">
      <attributeEditorField name="fk_precision" index="6" showLabel="1"/>
      <attributeEditorField name="fk_pressurezone" index="28" showLabel="1"/>
      <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="1" name="geometrie_col1" visibilityExpression="" columnCount="1" showLabel="0">
        <attributeEditorField name="_length2d" index="30" showLabel="1"/>
        <attributeEditorField name="_length3d" index="31" showLabel="1"/>
        <attributeEditorField name="_diff_elevation" index="32" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="1" name="geometrie_col2" visibilityExpression="" columnCount="1" showLabel="0">
        <attributeEditorField name="_printmaps" index="33" showLabel="1"/>
        <attributeEditorField name="fk_node_a" index="25" showLabel="1"/>
        <attributeEditorField name="fk_node_b" index="26" showLabel="1"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="0" name="Rendu" visibilityExpression="" columnCount="2" showLabel="1">
      <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="1" name="Schématique" visibilityExpression="" columnCount="1" showLabel="1">
        <attributeEditorField name="schema_force_visible" index="40" showLabel="1"/>
        <attributeEditorField name="_geometry_alt1_used" index="34" showLabel="1"/>
        <attributeEditorField name="fk_parent" index="1" showLabel="1"/>
        <attributeEditorField name="fk_precision" index="6" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="1" name="Etiquettes par échelle" visibilityExpression="" columnCount="1" showLabel="1">
        <attributeEditorField name="label_1_visible" index="21" showLabel="1"/>
        <attributeEditorField name="label_1_text" index="22" showLabel="1"/>
        <attributeEditorField name="label_2_visible" index="23" showLabel="1"/>
        <attributeEditorField name="label_2_text" index="24" showLabel="1"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="0" name="Abonnés" visibilityExpression="" columnCount="2" showLabel="1">
      <attributeEditorRelation name="relation_pipe_subscriber" showUnlinkButton="1" showLinkButton="1" relation="relation_pipe_subscriber" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="0" name="Fuites" visibilityExpression="" columnCount="2" showLabel="1">
      <attributeEditorRelation name="relation_pipe_leak" showUnlinkButton="1" showLinkButton="1" relation="relation_pipe_leak" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpressionEnabled="0" groupBox="0" name="Emplacement" visibilityExpression="" columnCount="2" showLabel="1">
      <attributeEditorField name="fk_locationtype" index="11" showLabel="1"/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="_diff_elevation" editable="0"/>
    <field name="_geometry_alt1_used" editable="0"/>
    <field name="_geometry_alt2_used" editable="0"/>
    <field name="_length2d" editable="0"/>
    <field name="_length3d" editable="0"/>
    <field name="_printmaps" editable="0"/>
    <field name="_schema_visible" editable="0"/>
    <field name="_valve_closed" editable="0"/>
    <field name="_valve_count" editable="0"/>
    <field name="fk_bedding" editable="1"/>
    <field name="fk_distributor" editable="1"/>
    <field name="fk_district" editable="1"/>
    <field name="fk_folder" editable="1"/>
    <field name="fk_function" editable="1"/>
    <field name="fk_installmethod" editable="1"/>
    <field name="fk_locationtype" editable="1"/>
    <field name="fk_material" editable="1"/>
    <field name="fk_node_a" editable="0"/>
    <field name="fk_node_b" editable="0"/>
    <field name="fk_parent" editable="1"/>
    <field name="fk_precision" editable="1"/>
    <field name="fk_pressurezone" editable="1"/>
    <field name="fk_printmap" editable="1"/>
    <field name="fk_protection" editable="1"/>
    <field name="fk_status" editable="1"/>
    <field name="fk_watertype" editable="1"/>
    <field name="geometry_alt1" editable="1"/>
    <field name="geometry_alt2" editable="1"/>
    <field name="id" editable="1"/>
    <field name="label_1_text" editable="1"/>
    <field name="label_1_visible" editable="1"/>
    <field name="label_2_text" editable="1"/>
    <field name="label_2_visible" editable="1"/>
    <field name="pipe_function_major" editable="0"/>
    <field name="pipe_function_schema_visible" editable="0"/>
    <field name="pipe_function_value_en" editable="0"/>
    <field name="pipe_function_value_fr" editable="0"/>
    <field name="pipe_function_value_ro" editable="0"/>
    <field name="pipe_material__displayname_en" editable="0"/>
    <field name="pipe_material__displayname_fr" editable="0"/>
    <field name="pipe_material__displayname_ro" editable="0"/>
    <field name="pipe_material_diameter" editable="0"/>
    <field name="pipe_material_diameter_external" editable="0"/>
    <field name="pipe_material_diameter_nominal" editable="0"/>
    <field name="pipe_material_short_en" editable="0"/>
    <field name="pipe_material_short_fr" editable="0"/>
    <field name="pipe_material_short_ro" editable="0"/>
    <field name="pipe_material_value_en" editable="0"/>
    <field name="pipe_material_value_fr" editable="0"/>
    <field name="pipe_material_value_ro" editable="0"/>
    <field name="pipe_protection_value_en" editable="0"/>
    <field name="pipe_protection_value_fr" editable="0"/>
    <field name="pipe_protection_value_ro" editable="0"/>
    <field name="pressure_nominal" editable="1"/>
    <field name="pressurezone_colorcode" editable="0"/>
    <field name="pressurezone_name" editable="0"/>
    <field name="qwat_ext_ch_vd_sire_adesafecter" editable="1"/>
    <field name="qwat_ext_ch_vd_sire_diametre" editable="1"/>
    <field name="qwat_ext_ch_vd_sire_etat_exploitation" editable="1"/>
    <field name="qwat_ext_ch_vd_sire_remarque" editable="1"/>
    <field name="remark" editable="1"/>
    <field name="schema_force_visible" editable="1"/>
    <field name="status_active" editable="0"/>
    <field name="status_functional" editable="0"/>
    <field name="status_value_en" editable="0"/>
    <field name="status_value_fr" editable="0"/>
    <field name="status_value_ro" editable="0"/>
    <field name="tunnel_or_bridge" editable="1"/>
    <field name="update_geometry_alt1" editable="1"/>
    <field name="update_geometry_alt2" editable="1"/>
    <field name="year" editable="1"/>
    <field name="year_end" editable="1"/>
    <field name="year_rehabilitation" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="_diff_elevation" labelOnTop="0"/>
    <field name="_geometry_alt1_used" labelOnTop="0"/>
    <field name="_geometry_alt2_used" labelOnTop="0"/>
    <field name="_length2d" labelOnTop="0"/>
    <field name="_length3d" labelOnTop="0"/>
    <field name="_printmaps" labelOnTop="0"/>
    <field name="_schema_visible" labelOnTop="0"/>
    <field name="_valve_closed" labelOnTop="0"/>
    <field name="_valve_count" labelOnTop="0"/>
    <field name="fk_bedding" labelOnTop="0"/>
    <field name="fk_distributor" labelOnTop="0"/>
    <field name="fk_district" labelOnTop="0"/>
    <field name="fk_folder" labelOnTop="0"/>
    <field name="fk_function" labelOnTop="0"/>
    <field name="fk_installmethod" labelOnTop="0"/>
    <field name="fk_locationtype" labelOnTop="0"/>
    <field name="fk_material" labelOnTop="0"/>
    <field name="fk_node_a" labelOnTop="0"/>
    <field name="fk_node_b" labelOnTop="0"/>
    <field name="fk_parent" labelOnTop="0"/>
    <field name="fk_precision" labelOnTop="0"/>
    <field name="fk_pressurezone" labelOnTop="0"/>
    <field name="fk_printmap" labelOnTop="0"/>
    <field name="fk_protection" labelOnTop="0"/>
    <field name="fk_status" labelOnTop="0"/>
    <field name="fk_watertype" labelOnTop="0"/>
    <field name="geometry_alt1" labelOnTop="0"/>
    <field name="geometry_alt2" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="label_1_text" labelOnTop="0"/>
    <field name="label_1_visible" labelOnTop="0"/>
    <field name="label_2_text" labelOnTop="0"/>
    <field name="label_2_visible" labelOnTop="0"/>
    <field name="pipe_function_major" labelOnTop="0"/>
    <field name="pipe_function_schema_visible" labelOnTop="0"/>
    <field name="pipe_function_value_en" labelOnTop="0"/>
    <field name="pipe_function_value_fr" labelOnTop="0"/>
    <field name="pipe_function_value_ro" labelOnTop="0"/>
    <field name="pipe_material__displayname_en" labelOnTop="0"/>
    <field name="pipe_material__displayname_fr" labelOnTop="0"/>
    <field name="pipe_material__displayname_ro" labelOnTop="0"/>
    <field name="pipe_material_diameter" labelOnTop="0"/>
    <field name="pipe_material_diameter_external" labelOnTop="0"/>
    <field name="pipe_material_diameter_nominal" labelOnTop="0"/>
    <field name="pipe_material_short_en" labelOnTop="0"/>
    <field name="pipe_material_short_fr" labelOnTop="0"/>
    <field name="pipe_material_short_ro" labelOnTop="0"/>
    <field name="pipe_material_value_en" labelOnTop="0"/>
    <field name="pipe_material_value_fr" labelOnTop="0"/>
    <field name="pipe_material_value_ro" labelOnTop="0"/>
    <field name="pipe_protection_value_en" labelOnTop="0"/>
    <field name="pipe_protection_value_fr" labelOnTop="0"/>
    <field name="pipe_protection_value_ro" labelOnTop="0"/>
    <field name="pressure_nominal" labelOnTop="0"/>
    <field name="pressurezone_colorcode" labelOnTop="0"/>
    <field name="pressurezone_name" labelOnTop="0"/>
    <field name="qwat_ext_ch_vd_sire_adesafecter" labelOnTop="0"/>
    <field name="qwat_ext_ch_vd_sire_diametre" labelOnTop="0"/>
    <field name="qwat_ext_ch_vd_sire_etat_exploitation" labelOnTop="0"/>
    <field name="qwat_ext_ch_vd_sire_remarque" labelOnTop="0"/>
    <field name="remark" labelOnTop="0"/>
    <field name="schema_force_visible" labelOnTop="0"/>
    <field name="status_active" labelOnTop="0"/>
    <field name="status_functional" labelOnTop="0"/>
    <field name="status_value_en" labelOnTop="0"/>
    <field name="status_value_fr" labelOnTop="0"/>
    <field name="status_value_ro" labelOnTop="0"/>
    <field name="tunnel_or_bridge" labelOnTop="0"/>
    <field name="update_geometry_alt1" labelOnTop="0"/>
    <field name="update_geometry_alt2" labelOnTop="0"/>
    <field name="year" labelOnTop="0"/>
    <field name="year_end" labelOnTop="0"/>
    <field name="year_rehabilitation" labelOnTop="0"/>
  </labelOnTop>
  <widgets>
    <widget name="relation_pipe_leak">
      <config type="Map">
        <Option type="QString" name="nm-rel" value=""/>
      </config>
    </widget>
    <widget name="relation_pipe_meter">
      <config type="Map">
        <Option type="QString" name="nm-rel" value=""/>
      </config>
    </widget>
    <widget name="relation_pipe_parent">
      <config type="Map">
        <Option type="QString" name="nm-rel" value=""/>
      </config>
    </widget>
    <widget name="relation_pipe_subscriber">
      <config type="Map">
        <Option type="QString" name="nm-rel" value=""/>
      </config>
    </widget>
    <widget name="relation_pump_pipe_in">
      <config type="Map">
        <Option type="QString" name="nm-rel" value=""/>
      </config>
    </widget>
    <widget name="relation_pump_pipe_out">
      <config type="Map">
        <Option type="QString" name="nm-rel" value=""/>
      </config>
    </widget>
    <widget name="relation_valve_pipe">
      <config type="Map">
        <Option type="QString" name="nm-rel" value=""/>
      </config>
    </widget>
  </widgets>
  <layerGeometryType>1</layerGeometryType>
</qgis>
