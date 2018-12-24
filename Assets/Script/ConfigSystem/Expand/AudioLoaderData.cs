using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace Game.Config
{
    public partial class AudioLoader : ScriptableObjectBase
    {
        public partial class Data : ObjectBase
        {
            public override void ParseData()
            {
                base.ParseData();
            }
        }

        public AudioClip GetAudioById(uint uAudioId)
        {
            string strFileName = this.GetData<AudioLoader.Data>(uAudioId).Path;
            if (strFileName.Equals(""))
            {
                Debug.LogWarning("对应文件名未配置");
                return null;
            }
            string strPath = "Assets/Resources/Audio/";
            AudioClip tempAudio = (AudioClip)AssetDatabase.LoadAssetAtPath(strPath + strFileName, typeof(AudioClip));
            if(tempAudio == null)
            {
                Debug.Log("对应文件丢失，路径：" + strPath + strFileName);
            }
            return tempAudio;
        }
    }

}
