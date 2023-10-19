import QtQuick 2.6
import QtQuick.Controls 2.12

ERearLeftView
{
    alias_highbar.text:
    {
        LalistRearRightActivity_Qml.qml_name
    }

    alias_backButton.onClicked:
    {
        eRearRightViewloader.visible = false
    }
    alias_ListView.model:
    {
        model:LalistRearRightActivity_Qml
    }


}


