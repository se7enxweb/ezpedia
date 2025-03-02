<?php
/**
 * File containing the Html5 class.
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 * @version 2014.07.0
 */

namespace eZ\Bundle\EzPublishCoreBundle\FieldType\RichText\Converter;

use eZ\Publish\Core\FieldType\RichText\Converter\Xslt as XsltConverter;
use eZ\Publish\Core\MVC\ConfigResolverInterface;

/**
 * Adds ConfigResolver awareness to the Xslt converter.
 */
class Html5 extends XsltConverter
{
    public function __construct( $stylesheet, ConfigResolverInterface $configResolver )
    {
        $customStylesheets = $configResolver->getParameter( 'fieldtypes.ezrichtext.output_custom_xsl' );
        $customStylesheets = $customStylesheets ?: array();
        parent::__construct( $stylesheet, $customStylesheets );
    }
}
