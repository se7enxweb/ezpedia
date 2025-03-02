<?php
/**
 * File containing the Json Object class
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 * @version 2014.07.0
 */

namespace eZ\Publish\Core\REST\Common\Output\Generator\Json;

/**
 * Json object
 *
 * Special JSON object (\stdClass) implementation, which allows to access the
 * parent object it is assigned to again.
 */
class Object
{
    /**
     * Reference to the parent node
     *
     * @var \eZ\Publish\Core\REST\Common\Output\Generator\Json\Object
     */
    protected $_ref_parent;

    /**
     * Construct from optional parent node
     *
     * @param mixed $_ref_parent
     */
    public function __construct( $_ref_parent = null )
    {
        $this->_ref_parent = $_ref_parent;
    }

    /**
     * Get Parent of current node
     *
     * @return \eZ\Publish\Core\REST\Common\Output\Generator\Json\Object
     */
    public function getParent()
    {
        return $this->_ref_parent;
    }
}
