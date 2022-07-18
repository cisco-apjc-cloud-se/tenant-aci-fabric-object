variable "spine_switch" {
  type = object({
    name                  = string # (Required) Name of object Spine Switch Policy Group.
    annotation            = optional(string) # (Optional) Annotation of object Spine Switch Policy Group.
    name_alias            = optional(string) # (Optional) Name alias for object Spine Switch Policy Group.
    description           = optional(string) # (Optional) Description for object Spine Switch Policy Group.
    lldp_intf_policy = object({
      use_existing  = optional(bool)
      name          = optional(string)
    })
    cdp_intf_policy = object({
      use_existing  = optional(bool)
      name          = optional(string)
    })
  })
}

# relation_infra_rs_iacl_spine_profile - (Optional) Represents the relation to a CoPP Prefilter Profile for Spines (class iaclSpineProfile). Relationship the CoPP Prefilter Spine profile to be applied on spines Type: String.
# relation_infra_rs_spine_bfd_ipv4_inst_pol - (Optional) Represents the relation to a BFD Ipv4 Instance Policy (class bfdIpv4InstPol). Relationship to BFD Ipv4 Instance Policy Type: String.
# relation_infra_rs_spine_bfd_ipv6_inst_pol - (Optional) Represents the relation to a BFD Ipv6 Instance Policy (class bfdIpv6InstPol). Relationship to BFD Ipv6 Instance Policy Type: String.
# relation_infra_rs_spine_copp_profile - (Optional) Represents the relation to a CoPP Profile for Spines (class coppSpineProfile). Relationship the CoPP profile to be applied on spines Type: String.
# relation_infra_rs_spine_p_grp_to_cdp_if_pol - (Optional) Represents the relation to a Relation to cdp interface policy for mgmt port (class cdpIfPol). Relationship to cdp interface policy for mgmt port Type: String.
# relation_infra_rs_spine_p_grp_to_lldp_if_pol - (Optional) Represents the relation to a Relation to lldp interface policy for mgmt port (class lldpIfPol). Relationship to lldp interface policy for mgmt port Type: String.

variable "interface_policy_map" {}
