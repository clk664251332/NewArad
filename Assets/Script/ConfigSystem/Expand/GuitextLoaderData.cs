using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Game.Config
{
    public partial class GuitextLoader : ScriptableObjectBase
    {
        public partial class Data : ObjectBase
        {
            public override void ParseData()
            {
                base.ParseData();
            }
        }

        public string LogText(uint uIndex)
        {
            string strTemp = this.GetData<GuitextLoader.Data>(uIndex).Text;
            Debug.Log(strTemp);
            return strTemp;
        }
    }

}
