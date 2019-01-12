using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Game.Config
{
    public partial class SkillLoader : ScriptableObjectBase
    {
        public partial class Data : ObjectBase
        {
            public override void ParseData()
            {
                base.ParseData();
            }
        }

        public List<uint> GetEffectIdList(uint uIndex)
        {
            string strTemp = this.GetData<SkillLoader.Data>(uIndex).FixedEffectId;
            List<uint> listTemp = new List<uint>();

            CommonHelper.TransStrToUintList(listTemp, strTemp, '~');
            return listTemp;
        }
    }

}
