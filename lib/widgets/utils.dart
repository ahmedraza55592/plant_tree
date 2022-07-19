import 'package:flutter/material.dart';
import '../styles/index.dart';

showTermsAndConditionsBox(BuildContext context) async {
  return showDialog(
      context: context,
      barrierColor: Colors.transparent.withOpacity(.7),
      builder: (_) => SimpleDialog(
            titlePadding:
                EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 20.0.h),
            elevation: 2.0,
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0.r)),
            title: Text(
              'Terms and Conditons',
              style: TextStyles.body19,
            ),
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * .7,
                  width: MediaQuery.of(context).size.width * .9,
                  child: ListView(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "Privacy Policy",
                        maxLines: 2,
                        style: TextStyles.body16.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                      child: Text(
                        "Last updated: May 30, 2022\n\nThis Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\n\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Generator](https://www.termsfeed.com/privacy-policy-generator/).",
                        maxLines: 20,
                        style: TextStyles.body15,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "Interpretation and Definitions",
                        maxLines: 2,
                        style: TextStyles.body16.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "Interpretation",
                        maxLines: 2,
                        style: TextStyles.body16.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.",
                        maxLines: 5,
                        style: TextStyles.body15,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "Definitions",
                        maxLines: 2,
                        style: TextStyles.body16.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        """For the purposes of this Privacy Policy:\n\n\t* Account means a unique account created for You to access our Service or
    parts of our Service.

  * Affiliate means an entity that controls, is controlled by or is under
    common control with a party, where "control" means ownership of 50% or
    more of the shares, equity interest or other securities entitled to vote
    for election of directors or other managing authority.

  * Application means the software program provided by the Company downloaded
    by You on any electronic device, named Plant A Tree.

  * Company (referred to as either "the Company", "We", "Us" or "Our" in this
    Agreement) refers to Plant A Tree.

  * Country refers to: Pakistan

  * Device means any device that can access the Service such as a computer, a
    cellphone or a digital tablet.

  * Personal Data is any information that relates to an identified or
    identifiable individual.

  * Service refers to the Application.

  * Service Provider means any natural or legal person who processes the data
    on behalf of the Company. It refers to third-party companies or
    individuals employed by the Company to facilitate the Service, to provide
    the Service on behalf of the Company, to perform services related to the
    Service or to assist the Company in analyzing how the Service is used.

  * Usage Data refers to data collected automatically, either generated by the
    use of the Service or from the Service infrastructure itself (for example,
    the duration of a page visit).

  * You means the individual accessing or using the Service, or the company,
    or other legal entity on behalf of which such individual is accessing or
    using the Service, as applicable.

""",
                        style: TextStyles.body15,
                        maxLines: 5,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "4. This is Fourth Term. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. ",
                        maxLines: 5,
                        style: TextStyles.body15,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "5. This is Fifth Term, The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. ",
                        maxLines: 5,
                        style: TextStyles.body15,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "6. This is Sixth Term, The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. The Quick brown fox jumps over the lazy dog. ",
                        maxLines: 5,
                        style: TextStyles.body15,
                      ),
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                  ])),
            ],
          ));
}
