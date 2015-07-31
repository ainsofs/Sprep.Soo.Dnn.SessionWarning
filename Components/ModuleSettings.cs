using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sprep.Soo.Dnn.SessionWarning.Components {
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using DotNetNuke.Entities.Modules;

    namespace Sprep.Soo.DNN.PDPModule.Components {
        public class ModuleSettings {

            //private int _kraTab = -1;
            //private int _behaviourTab = -1;
            private int _portalId = 0;
            private int _siteModuleId = 0;
            public const int _warningTimeoutInMinutesDefault = 5;
            public const string _timeoutTextDefault = "";
            public const string _timeoutWarningTextDefault = "";

            #region Properties
            public int WarningTimeoutInMinutes {
                get {
                    if (GetValue("WarningTimeoutInMinutes") != null)
                        return Convert.ToInt32(GetValue("WarningTimeoutInMinutes"));
                    return _warningTimeoutInMinutesDefault;
                }
                set { SetValue("WarningTimeoutInMinutes", value.ToString()); }
            }
            public string TimeoutText {
                get
                {
                    var st = GetValue("TimeoutText");
                    if (st != null){
                        return st;
                    }

                    return _timeoutTextDefault;
                }
                set { SetValue("TimeoutText", value); }
            }
            public string TimeoutWarningText {
                get {
                    var st = GetValue("TimeoutWarningText");
                    if (st != null) {
                        return st;
                    }

                    return _timeoutWarningTextDefault;
                }
                set { SetValue("TimeoutWarningText", value); }
            }

            #endregion


            public ModuleSettings(int portalId, int siteModuleId) {
                _portalId = portalId;
                _siteModuleId = siteModuleId;

                ModuleController moduleController = new ModuleController();
                _siteModuleId = moduleController.GetModuleByDefinition(_portalId, ModuleKeys.ModuleDefinitionName).ModuleID;
            }

            #region Getter/Setters
            private void SetValue(string theKey, string theValue) {
                ModuleController moduleController = new ModuleController();
                //int siteModuleId = moduleController.GetModuleByDefinition(_portalId, "PDPModule").ModuleID;
                moduleController.UpdateModuleSetting(_siteModuleId, theKey, theValue);
            }

            private string GetValue(string theKey) {
                Hashtable settings = (new DotNetNuke.Entities.Modules.ModuleController().GetModuleSettings(_siteModuleId));
                //ModuleController moduleController = new ModuleController();
                //int siteModuleId = moduleController.GetModuleByDefinition(_portalId, "PDPModule").ModuleID;
                //Hashtable settings = (new DotNetNuke.Entities.Modules.ModuleController().GetModuleSettings(siteModuleId));

                if (settings.Contains(theKey))
                    return settings[theKey].ToString();

                return null;
            }
            #endregion
        }
    }
}